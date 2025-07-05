import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/bloc/login/login_bloc.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/recaptcha_section.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _linkedInController = TextEditingController();

  File? _selectedPdf;
  String? _pdfFileName;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _linkedInController.dispose();
    super.dispose();
  }

  PlatformFile? file;

  Future<void> _pickPdf() async {
    if (_formKey.currentState!.validate()) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: true, // required for web to access bytes
      );

      if (result != null && result.files.single.bytes != null) {
        file = result.files.single;
        const maxSizeInBytes = 3 * 1024 * 1024; // 3MB

        // File size check
        if (file!.size > maxSizeInBytes) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File size must be below 3MB')),
          );
          return;
        }

        // Extension check (safe side)
        if (!file!.name.toLowerCase().endsWith('.pdf')) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a valid PDF file')),
          );
          return;
        }

        setState(() {
          _selectedPdf = File(file!.path ?? ''); // only works on mobile/desktop
          _pdfFileName = file!.name;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CareersBloc, CareersState>(
      listener: (context, state) {
        if (state.submitResumeStatus == SubmitResumeStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Application Submitted!')),
          );
          _firstNameController.clear();
          _lastNameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _linkedInController.clear();
          _selectedPdf = null;
          context.read<LoginBloc>().add(const LoginInit());

          file = null;
          setState(() {});
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            return Container(
              width: 400,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextField(
                      'First name*',
                      (value) => value == null || value.isEmpty
                          ? 'Please enter your first name'
                          : null,
                      controller: _firstNameController,
                    ),
                    const Gap(16),
                    _buildTextField(
                      'Last name*',
                      (value) => value == null || value.isEmpty
                          ? 'Please enter your last name'
                          : null,
                      controller: _lastNameController,
                    ),
                    const Gap(16),
                    _buildTextField(
                      'Email*',
                      (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter your email';
                        if (!RegExp(
                                r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                            .hasMatch(value)) return 'Enter a valid email';
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const Gap(16),
                    _buildTextField(
                      'Phone number*',
                      (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter your phone number';
                        if (!RegExp(r"^\d+$").hasMatch(value))
                          return 'Enter a valid phone number';
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                    ),
                    const Gap(16),
                    _buildTextField(
                      'LinkedIn Profile Link*',
                      (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter your LinkedIn URL';
                        return null;
                      },
                      controller: _linkedInController,
                    ),
                    const Gap(16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _pickPdf,
                          icon: const Icon(Icons.upload),
                          label: const Text('Upload CV'),
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Gap(getValueForScreenType(
                          context: context,
                          mobile: 10,
                          desktop: 20,
                          tablet: 15,
                        )),
                        Expanded(
                          child: Kstyles().med(
                            text: _pdfFileName ?? "Only accepts .pdf",
                            size: getValueForScreenType(
                              context: context,
                              mobile: 8,
                              tablet: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    ReCaptchaIntegration(
                      onChanged: (bool? value) {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(ReCaptchaTapEvent(
                                checkBoxValue: value ?? false,
                              ));
                          Timer(
                              const Duration(
                                seconds: 15,
                              ), () {
                            if (context.mounted) {
                              context
                                  .read<LoginBloc>()
                                  .add(const ReCaptchaTapEvent2(
                                    checkBoxValue: false,
                                  ));
                            }
                          });
                        }
                      },
                      isChecked: loginState.isReCaptchaChecked ?? false,
                    ),
                    Gap(15),
                    CustomButtonWidget(
                      textSize: getValueForScreenType(
                          context: context,
                          mobile: 10,
                          desktop: 14,
                          tablet: 12),
                      text: "Submit Application",
                      bgButtonColor: AppColors.darkOrangeColor,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (loginState.isReCaptchaChecked != true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please tick the check box')),
                            );
                            return;
                          }
                          if (_selectedPdf == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please upload your CV (PDF only)')),
                            );
                            return;
                          }

                          final firstName = _firstNameController.text.trim();
                          final lastName = _lastNameController.text.trim();
                          final email = _emailController.text.trim();
                          final phone = _phoneController.text.trim();
                          final linkedIn = _linkedInController.text.trim();

                          context.read<CareersBloc>().add(UploadPdfEvent(
                                file: file,
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                phone: phone,
                                linkedIn: linkedIn,
                              ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField(
    String hintText,
    String? Function(String?) validator, {
    TextInputType keyboardType = TextInputType.text,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}

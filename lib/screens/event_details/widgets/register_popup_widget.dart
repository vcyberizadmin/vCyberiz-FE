// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import 'success_alert.dart';

void registrationDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: true, // Prevent closing by tap outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: BlocConsumer<EventsBloc, EventsState>(
          listener: (context, state) {
            if (state.registerStatus == RegisterStatus.success) {
              context.pop();
              showSuccessDialog(context);
            }
          },
          builder: (context, state) {
            return Container(
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width * .9,
                tablet: Constants.width * .9,
                desktop: Constants.width * .5,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ],
                    ),
                    kStyle.med(
                      text: state.registerDetailsData?.secHeader ?? '',
                      size: getValueForScreenType(
                          context: context,
                          mobile: 20,
                          tablet: 24,
                          desktop: 28),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // Full Name
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name *',
                              hintText: 'e.g. John Taylor',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Full name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Email
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Business Email *',
                              hintText: 'e.g johntaylor@company.co',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Mobile Number
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number *',
                              hintText: 'XXXXXXXXXX',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mobile number is required';
                              }
                              if (value.length < 10) {
                                return 'Enter a valid 10-digit number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Consent Text
                          kStyle.reg(
                            text:
                                state.registerDetailsData?.secDescription ?? '',
                            size: 14,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.visible,
                          ),
                          const SizedBox(height: 24),

                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<EventsBloc>()
                                      .add(RegisterEventsEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        mobile: phoneController.text,
                                        eventId: state
                                                .eventDetailsData?.documentId ??
                                            '',
                                        eventName: state
                                                .eventDetailsData?.eventTitle ??
                                            '',
                                      ));
                                }
                              },
                              child: kStyle.med(
                                text:
                                    state.registerDetailsData?.secCta?.label ??
                                        '',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

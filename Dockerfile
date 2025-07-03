# ------------------------------
# Stage 1: Build Flutter Web App
# ------------------------------
    FROM dart:stable AS build
 
    # Install dependencies
    RUN apt-get update && \
        apt-get install -y git curl unzip xz-utils && \
        git clone https://github.com/flutter/flutter.git -b stable /flutter && \
        ln -s /flutter/bin/flutter /usr/bin/flutter && \
        flutter doctor
    
    # Add Flutter to PATH
    ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"
    
    WORKDIR /app
    COPY . .
    
    # Get packages and build Flutter web
    RUN flutter pub get
    RUN flutter build web --release
    
    # ------------------------------
    # Stage 2: Serve with http-server
    # ------------------------------
    FROM nginx:alpine
 
    COPY --from=build /app/build/web /usr/share/nginx/html
    COPY nginx.conf /etc/nginx/conf.d/default.conf
        
    EXPOSE 80
    CMD ["nginx", "-g", "daemon off;"]


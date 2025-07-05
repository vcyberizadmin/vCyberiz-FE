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

# Install Dart/Flutter packages
RUN flutter pub get

# Build Flutter web
RUN flutter build web --release

# ✅ Copy 'data/' folder into the built web output so it's served
RUN mkdir -p /app/build/web/data && cp -r /app/data/* /app/build/web/data/

# ------------------------------
# Stage 2: Serve with Nginx
# ------------------------------
FROM nginx:alpine

# Copy web build output to nginx public folder
COPY --from=build /app/build/web /usr/share/nginx/html

# Custom nginx config (optional)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

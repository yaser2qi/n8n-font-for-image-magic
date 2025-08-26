# استفاده از ایمیج رسمی n8n مبتنی بر Node.js
FROM n8nio/n8n:latest

# ست کردن دایرکتوری کاری
WORKDIR /data

# نصب ImageMagick و فونت‌ها
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    fonts-noto \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# نصب فونت فارسی Vazir
RUN wget https://github.com/rastikerdar/vazir-font/releases/download/v30.1.0/Vazir-font-v30.1.0.zip \
    -O /tmp/vazir.zip \
    && unzip /tmp/vazir.zip -d /usr/share/fonts/truetype/vazir \
    && fc-cache -fv \
    && rm /tmp/vazir.zip

# تنظیم پورت پیش‌فرض n8n
EXPOSE 5678

# اجرای n8n
USER node
CMD ["n8n", "start"]


# ایمیج Node.js بر پایه Debian
FROM node:18-bullseye

# نصب ابزارها و فونت‌ها
RUN apt-get update && apt-get install -y \
    imagemagick \
    fonts-noto \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# نصب n8n
RUN npm install -g n8n

# نصب فونت فارسی Vazir
RUN wget https://github.com/rastikerdar/vazir-font/releases/download/v30.1.0/Vazir-font-v30.1.0.zip \
    -O /tmp/vazir.zip \
    && unzip /tmp/vazir.zip -d /usr/share/fonts/truetype/vazir \
    && fc-cache -fv \
    && rm /tmp/vazir.zip

# دایرکتوری کاری
WORKDIR /data

# پورت پیش‌فرض n8n
EXPOSE 5678

# اجرای n8n
CMD ["n8n", "start"]

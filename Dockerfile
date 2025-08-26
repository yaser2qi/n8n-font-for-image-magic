# استفاده از ایمیج رسمی n8n
FROM n8nio/n8n:latest

# ست کردن دایرکتوری کاری
WORKDIR /data

# نصب ImageMagick و فونت‌ها روی Alpine
RUN apk add --no-cache \
    imagemagick \
    fontconfig \
    ttf-dejavu \
    ttf-freefont \
    font-noto

# پورت پیش‌فرض n8n
EXPOSE 5678

# اجرای n8n
CMD ["n8n", "start"]


# پایه: n8n آخرین نسخه
FROM n8nio/n8n:latest

# سوئیچ به کاربر root برای نصب بسته‌ها
USER root

# نصب ImageMagick و فونت‌ها با apk (مخصوص Alpine)
RUN apk add --no-cache \
    imagemagick \
    fontconfig \
    ttf-dejavu \
    ttf-freefont \
    && rm -rf /var/cache/apk/*

# ساخت فولدر برای فونت‌های سفارشی و اضافه کردن فونت فارسی
RUN mkdir -p /usr/share/fonts/truetype/custom
COPY Vazirmatn-Regular.ttf /usr/share/fonts/truetype/custom/
RUN fc-cache -f -v

# برگرداندن کاربر به node
USER node

# پوشه کاری
WORKDIR /data

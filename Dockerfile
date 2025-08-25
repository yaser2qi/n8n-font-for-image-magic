FROM n8nio/n8n:latest

# سوئیچ به root
USER root

# نصب ImageMagick و فونت‌ها روی Alpine
RUN apk add --no-cache \
    imagemagick \
    fontconfig \
    ttf-dejavu \
    ttf-freefont \
    && rm -rf /var/cache/apk/*

# کپی فونت فارسی سفارشی (مثلا Vazirmatn)
RUN mkdir -p /usr/share/fonts/truetype/custom
COPY Vazirmatn-Regular.ttf /usr/share/fonts/truetype/custom/
RUN fc-cache -f -v

# برگرداندن یوزر
USER node

WORKDIR /data

FROM n8nio/n8n:latest

# نصب ImageMagick و فونت‌های فارسی
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    fonts-noto \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

# اضافه کردن فونت فارسی (مثلاً Vazir یا Vazirmatn)
COPY Vazirmatn-Regular.ttf /usr/share/fonts/truetype/custom/
RUN fc-cache -f -v

USER node
WORKDIR /data

CMD ["n8n", "start"]

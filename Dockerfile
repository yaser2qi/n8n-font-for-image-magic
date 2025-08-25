# ایمیج پایه n8n
FROM n8nio/n8n:latest

# رفتن به root برای نصب پکیج‌ها
USER root

# نصب ImageMagick و فونت‌ها
RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    fonts-freefont-ttf \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

# دانلود و نصب فونت فارسی Vazirmatn
RUN mkdir -p /usr/share/fonts/truetype/custom && \
    wget https://github.com/rastikerdar/vazirmatn/releases/download/v33.003/Vazirmatn-font-v33.003.zip -O /tmp/vazirmatn.zip && \
    unzip /tmp/vazirmatn.zip -d /usr/share/fonts/truetype/custom/ && \
    fc-cache -f -v && \
    rm -rf /tmp/vazirmatn.zip

# برگشت به user اصلی n8n
USER node
WORKDIR /data

# دستور شروع n8n
CMD ["n8n", "start"]

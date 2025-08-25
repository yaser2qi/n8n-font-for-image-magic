
# استفاده از ایمیج رسمی n8n
FROM n8nio/n8n:latest

# ست کردن دایرکتوری کاری
WORKDIR /data

# کپی کردن فایل‌های پیکربندی (اختیاری)
# COPY . .

# پورت پیش‌فرض n8n
EXPOSE 5678

# اجرای n8n
CMD ["n8n", "start"]

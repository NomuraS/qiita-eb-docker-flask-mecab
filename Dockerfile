FROM python:3.6 
COPY . /app
WORKDIR /app

# 以下追加
RUN apt update
RUN apt install mecab -y
RUN apt install mecab-ipadic -y
RUN apt install libmecab-dev -y
RUN apt install mecab-ipadic-utf8 -y
RUN pip install mecab-python3
RUN cp /etc/mecabrc /usr/local/etc/ # ← 重要
# 追加終わり

RUN pip install Flask==1.0.2
EXPOSE 5000
CMD ["python", "application.py"]

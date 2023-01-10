FROM python:3.10-slim

RUN python -m pip install rasa[spacy]

RUN python -m spacy download de_core_news_lg

COPY . .

RUN rasa train

ENTRYPOINT ["rasa"]

CMD ["run", "--enable-api", "--port", "5005"]

EXPOSE 5005
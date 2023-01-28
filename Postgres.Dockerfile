FROM postgres
ENV POSTGRES_PASSWORD jeejee123
ENV POSTGRES_DB resta
COPY dump.sql /docker-entrypoint-initdb.d/
EXPOSE 5432

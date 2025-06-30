--liquibase formatted sql
--changeset smithj:202529062200_createScrapPagesTable
--preconditions onFail:MARK_RAN, onError:MARK_RAN
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name ='sample_table'

CREATE TYPE scrapType AS ENUM ('webpage', 'webapi', 'soap');
CREATE TYPE responseFormatType AS ENUM ('html', 'xml', 'json', 'yml');

CREATE TABLE carPageScrap (
     name varchar(500),
     pageType scrapType,
     dataType responseFormatType
);

--rollback drop table sample_table
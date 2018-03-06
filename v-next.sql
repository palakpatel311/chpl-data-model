<<<<<<< HEAD
update openchpl.questionable_activity_trigger set name = 'Current Certification Status Edited' where name = 'Certification Status Edited';
INSERT INTO openchpl.questionable_activity_trigger (name, level, last_modified_user) select 'Current Certification Date Edited', 'Listing', -1 where not exists (select * from openchpl.questionable_activity_trigger where name = 'Current Certification Date Edited');
INSERT INTO openchpl.questionable_activity_trigger (name, level, last_modified_user) select 'Historical Certification Status Edited', 'Listing', -1 where not exists (select * from openchpl.questionable_activity_trigger where name = 'Historical Certification Status Edited');

-- BEGIN OCD-2082

DROP SEQUENCE IF EXISTS openchpl.sed_participants_statistics_count_seq;

CREATE SEQUENCE openchpl.sed_participants_statistics_count_seq INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

DROP TABLE IF EXISTS openchpl.sed_participants_statistics_count;

CREATE TABLE openchpl.sed_participants_statistics_count
(
  	id bigint NOT NULL DEFAULT nextval('openchpl.sed_participants_statistics_count_seq'::regclass),
  	participant_count bigint NOT NULL,
	sed_count bigint NOT NULL,
  	creation_date timestamp without time zone NOT NULL DEFAULT now(),
  	last_modified_date timestamp without time zone NOT NULL DEFAULT now(),
  	last_modified_user bigint NOT NULL,
  	deleted boolean NOT NULL DEFAULT false,
  CONSTRAINT sed_participants_statistics_count_pk PRIMARY KEY (id)
);

CREATE TRIGGER sed_participants_statistics_count_audit AFTER INSERT OR UPDATE OR DELETE on openchpl.sed_participants_statistics_count FOR EACH ROW EXECUTE PROCEDURE audit.if_modified_func();
CREATE TRIGGER sed_participants_statistics_count_timestamp BEFORE UPDATE on openchpl.sed_participants_statistics_count FOR EACH ROW EXECUTE PROCEDURE openchpl.update_last_modified_date_column();

-- END OCD-2082
=======
--
-- OCD-2100: Delete some Lisitngs
--
update openchpl.certified_product set deleted = true where certified_product_id = 9102;
update openchpl.certified_product set deleted = true where certified_product_id = 9241;
update openchpl.certified_product set deleted = true where certified_product_id = 9252;
>>>>>>> 6f0700c9461f90fe360bc60ea06d484d8a38281f

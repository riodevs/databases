USE master
GO
CREATE DATABASE control_db
GO
USE control_db
GO
/*	
	Tabela para o painel de acompanhamento incidente. Com id por registro/entrada,
	indicadores de processamento das rotinas, registro de início e fim opcional, 
	data de entrada do registro.
*/
CREATE TABLE incident_tb (
	 incident_id	INT IDENTITY(1,1)	NOT NULL
	,job_id			INT					NOT NULL
	,status_id		CHAR(1)				NOT NULL
	,processing_dt	DATETIME			NOT NULL
	,begin_time		DATETIME			NULL
	,end_time		DATETIME			NULL
	,reg_entry		DATETIME			NOT NULL
)
GO
--	Tabela de domínio dos status. Sucesso, falha e não processado.
CREATE TABLE status_dom_tb (
	 status_id		CHAR(1)				NOT NULL
	,desc_status	VARCHAR(30)			NOT NULL
	,last_update	DATETIME			NOT NULL
CONSTRAINT pk_status PRIMARY KEY (status_id))
GO
--	Tabela de domínio dos jobs, assim como frequência de execução para uma visão geral apenas.
CREATE TABLE job_dom_tb (
	 job_id			INT					NOT NULL
	,desc_job		VARCHAR(100)		NOT NULL
	,frequency		CHAR(5)				NULL --DAY, WEEK, MONTH, YEAR
	,times			SMALLINT			NULL
	,last_update	DATETIME			NOT NULL
CONSTRAINT pk_job PRIMARY KEY (job_id))
GO
ALTER TABLE incident_tb
ADD CONSTRAINT fk_job_incident
FOREIGN KEY (job_id) REFERENCES job_dom_tb(job_id)
ALTER TABLE incident_tb
ADD CONSTRAINT fk_status_incident
FOREIGN KEY (status_id) REFERENCES status_dom_tb(status_id)
GO
--	Carga na tabela de domínio dos status
INSERT INTO status_dom_tb VALUES ('0', 'Success'	, GETDATE())
INSERT INTO status_dom_tb VALUES ('1', 'Error'		, GETDATE())
INSERT INTO status_dom_tb VALUES ('2', 'Unprocessed', GETDATE())
--	Carga na tabela de domínio dos jobs
INSERT INTO job_dom_tb VALUES (1, 'Rotina 1', 'DAY'  , 1, GETDATE())
INSERT INTO job_dom_tb VALUES (2, 'Rotina 2', 'WEEK' , 1, GETDATE())
INSERT INTO job_dom_tb VALUES (3, 'Rotina 3', 'DAY'  , 2, GETDATE())
INSERT INTO job_dom_tb VALUES (4, 'Rotina 4', 'MONTH', 1, GETDATE())
INSERT INTO job_dom_tb VALUES (5, 'Rotina 5', 'WEEK' , 2, GETDATE())
--	Carga teste na tabela de incidentes
INSERT INTO incident_tb VALUES (4, 0, '20181001', '20181001 00:00:50', '20181001 03:10:39', '20181001 03:10:50')
INSERT INTO incident_tb VALUES (1, 0, '20181001', NULL, NULL, '20181001 06:50:30')
INSERT INTO incident_tb VALUES (1, 1, '20181002', NULL, NULL, '20181002 06:10:21')
INSERT INTO incident_tb VALUES (1, 0, '20181002', NULL, NULL, '20181002 09:06:21')
INSERT INTO incident_tb VALUES (1, 0, '20181003', NULL, NULL, '20181003 06:30:50')
INSERT INTO incident_tb VALUES (1, 0, '20181004', NULL, NULL, '20181004 06:20:01')
INSERT INTO incident_tb VALUES (1, 0, '20181005', NULL, NULL, '20181005 06:20:01')
INSERT INTO incident_tb VALUES (1, 0, '20181006', NULL, NULL, '20181006 06:20:01')
INSERT INTO incident_tb VALUES (1, 0, '20181007', NULL, NULL, '20181007 06:20:01')
INSERT INTO incident_tb VALUES (1, 0, '20181008', NULL, NULL, '20181008 06:30:50')
INSERT INTO incident_tb VALUES (1, 0, '20181009', NULL, NULL, '20181009 06:20:01')
INSERT INTO incident_tb VALUES (1, 0, '20181010', NULL, NULL, '20181010 06:10:01')
INSERT INTO incident_tb VALUES (3, 0, '20181010', '20181010 05:00:01', '20181010 05:04:58', '20181010 05:05:01')
INSERT INTO incident_tb VALUES (3, 0, '20181010', '20181010 21:00:01', '20181010 23:14:01', '20181010 23:14:05')
INSERT INTO incident_tb VALUES (2, 0, '20181010', '20181010 16:00:00', '20181010 16:18:59', '20181010 16:19:01')
INSERT INTO incident_tb VALUES (1, 0, '20181011', NULL, NULL, '20181011 06:20:01')
INSERT INTO incident_tb VALUES (1, 0, '20181012', NULL, NULL, '20181012 06:30:21')
INSERT INTO incident_tb VALUES (1, 0, '20181013', NULL, NULL, '20181013 06:05:50')
INSERT INTO incident_tb VALUES (1, 0, '20181014', NULL, NULL, '20181014 06:02:01')
INSERT INTO incident_tb VALUES (1, 0, '20181015', NULL, NULL, '20181015 06:06:02')
INSERT INTO incident_tb VALUES (5, 0, '20181015', '20181015 00:00:00', '20181015 00:06:01', '20181015 00:06:02')
INSERT INTO incident_tb VALUES (1, 0, '20181016', NULL, NULL, '20181016 06:20:05')
INSERT INTO incident_tb VALUES (1, 0, '20181017', NULL, NULL, '20181017 06:00:06')
INSERT INTO incident_tb VALUES (1, 1, '20181018', NULL, NULL, '20181018 06:01:02')
INSERT INTO incident_tb VALUES (1, 0, '20181019', NULL, NULL, '20181019 06:20:06')
INSERT INTO incident_tb VALUES (1, 0, '20181020', NULL, NULL, '20181020 06:20:04')
INSERT INTO incident_tb VALUES (1, 0, '20181021', NULL, NULL, '20181021 06:20:15')
INSERT INTO incident_tb VALUES (1, 0, '20181022', NULL, NULL, '20181022 06:20:22')
INSERT INTO incident_tb VALUES (1, 1, '20181023', NULL, NULL, '20181023 06:02:20')
INSERT INTO incident_tb VALUES (1, 0, '20181024', NULL, NULL, '20181024 06:20:31')
INSERT INTO incident_tb VALUES (1, 0, '20181025', NULL, NULL, '20181025 06:20:51')
INSERT INTO incident_tb VALUES (1, 0, '20181026', NULL, NULL, '20181026 06:22:01')
INSERT INTO incident_tb VALUES (1, 0, '20181027', NULL, NULL, '20181027 06:21:01')
INSERT INTO incident_tb VALUES (1, 2, '20181028', NULL, NULL, '20181028 07:32:20')
INSERT INTO incident_tb VALUES (1, 0, '20181029', NULL, NULL, '20181029 06:25:11')
INSERT INTO incident_tb VALUES (1, 0, '20181030', NULL, NULL, '20181030 06:19:41')
INSERT INTO incident_tb VALUES (1, 0, '20181031', NULL, NULL, '20181031 06:19:08')
INSERT INTO incident_tb VALUES (5, 0, '20181031', '20181031 00:00:01','20181031 00:15:01', '20181031 00:15:02')
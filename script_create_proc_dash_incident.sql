/*	--------------------------------------------------------------------------------
	Criando procedure para consulta baseada na quantidade de dias passados informados
	--------------------------------------------------------------------------------
	consult_status_days_sp
	--------------------------------------------------------------------------------*/
CREATE PROCEDURE dbo.consult_last_days_sp
@days NUMERIC
AS
SELECT	UPPER(j.desc_job) as JOB, 
		UPPER(s.desc_status) as STATUS, 
		CONVERT(VARCHAR,i.processing_dt, 103) as DATE
	FROM dbo.incident_tb i, dbo.job_dom_tb j, dbo.status_dom_tb s
	WHERE j.job_id = i.job_id
	AND s.status_id = i.status_id
	AND i.processing_dt BETWEEN DATEADD(DAY,-@days,GETDATE()) AND GETDATE()

--Chamada da procedure com últimos 30 dias como teste.
--EXEC consult_last_days_sp 30;
GO
/*	--------------------------------------------------------------------------------
	Criando procedure para consulta baseada na quantidade de dias passados e status.
	--------------------------------------------------------------------------------
	consult_status_days_sp
	--------------------------------------------------------------------------------*/
CREATE PROCEDURE dbo.consult_status_days_sp
@status NUMERIC,
@days NUMERIC
AS
SELECT	UPPER(j.desc_job) as JOB, 
		UPPER(s.desc_status) as STATUS, 
		CONVERT(VARCHAR,i.processing_dt, 103) as DATE
	FROM dbo.incident_tb i, dbo.job_dom_tb j, dbo.status_dom_tb s
	WHERE j.job_id = i.job_id
	AND s.status_id = i.status_id
	AND i.processing_dt BETWEEN DATEADD(DAY,-@days,GETDATE()) AND GETDATE()
	AND i.status_id = CONVERT(CHAR(1),@status)

--Teste da procedure
--EXEC consult_status_days_sp 1, 60


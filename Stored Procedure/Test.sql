USE HR
EXEC SP_CARD_CONTROL 'F77AFC0D-8186-423F-B77D-855827F1E87B'

SELECT * FROM WORKERTRANSACTIONS
SELECT * FROM WORKERS

TRUNCATE TABLE WORKERTRANSACTIONS

EXEC SP_WORKER_INOUT 'F77AFC0D-8186-423F-B77D-855827F1E87B','2022-01-14 08:00:00','G',1

--TEST
--EXEC SP_WORKER_INOUT 'A77AFC0D-8186-423F-B77D-855827F1E87B','2022-01-14 08:00:00','G',1
--EXEC SP_WORKER_INOUT 'F77AFC0D-8186-423F-B77D-855827F1E87B','2022-01-14 08:00:00','G',1
--EXEC SP_WORKER_INOUT '2022-01-14 08:00:00','F77AFC0D-8186-423F-B77D-855827F1E87B','G',1

EXEC SP_WORKER_INOUT 'F77AFC0D-8186-423F-B77D-855827F1E87B','2022-01-14 10:00:00','C',1
EXEC SP_WORKER_INOUT 'F77AFC0D-8186-423F-B77D-855827F1E87B','2022-01-14 10:22:10','G',1
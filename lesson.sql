/*
Example lesson stub
*/
SELECT   ps.PatientId,
         ps.AdmittedDate,
         ps.DischargeDate,
         ps.Hospital,
         ps.Ward,
         ps.Ethnicity,
         DATEDIFF(day, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
FROM     PatientStay AS ps
WHERE    ps.Hospital IN ('Kingston', 'Pruh')
         AND --and ps.Ward LIKE '%Surgery'
         ps.AdmittedDate BETWEEN DATEFROMPARTS(2024, 2, 28) AND DATEFROMPARTS(2024, 3, 1)
ORDER BY LengthOfStay DESC, ps.AdmittedDate DESC;

SELECT   ps.Hospital,
         ps.ward,
         COUNT(*) AS numberofpatients,
         sum(ps.tariff) AS TotalTariff,
         max(ps.Tariff) AS BiggestTariff
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.Ward
HAVING   sum(ps.tariff) >= 10
ORDER BY TotalTariff DESC;
-- Classifying tenure_bucket, response_time and adding a report dy column

SELECT
  *,
  CASE
    WHEN tenure_bucket = 'On Job Training' THEN 'Training'
    WHEN tenure_bucket = '0-30' THEN 'Beginner'
    WHEN tenure_bucket = '31-60' THEN 'Junior'
    WHEN tenure_bucket = '61-90' THEN 'Intermediate'
    WHEN tenure_bucket = '>90' THEN 'Senior'
    ELSE NULL
  END AS tenure_segment,

    CASE 
        WHEN response_time = 0 THEN 'Immediately'
        WHEN response_time < 60 THEN 'Within an hour'
        WHEN response_time < 1440 THEN 'Within a day'
        ELSE 'More than a day'
    END AS delay_category,
    DATE(issue_reported_at) as report_date_day

FROM {{ ref('int_trad_company') }}
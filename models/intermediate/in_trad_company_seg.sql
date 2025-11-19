SELECT
  *,
  CASE
    WHEN tenure_bucket = 'On Job Training' THEN 'Training'
    WHEN tenure_bucket = '0-30' THEN 'Beginner'
    WHEN tenure_bucket = '31-60' THEN 'Junior'
    WHEN tenure_bucket = '61-90' THEN 'Intermediate'
    WHEN tenure_bucket = '>90' THEN 'Senior'
    ELSE NULL
  END AS tenure_segment

FROM {{ ref('int_trad_company') }}
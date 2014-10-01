# Amazon S3 output plugin for (Fluentd)[http://github.com/fluent/fluentd]

## Overview

[fluent-plugin-s3](https://github.com/fluent/fluent-plugin-s3) with time_slice_duration

## Configuration

```
<match pattern>
  type s3

  aws_key_id YOUR_AWS_KEY_ID
  aws_sec_key YOUR_AWS_SECRET/KEY
  s3_bucket YOUR_S3_BUCKET_NAME
  s3_endpoint s3-ap-northeast-1.amazonaws.com
  s3_object_key_format %{path}%{time_slice}_%{index}.%{file_extension}
  path logs/
  buffer_path /var/log/fluent/s3

  time_slice_format %Y%m%d-%H:%M
  time_slice_duration 3600 # <- slice by 30min.
  time_slice_wait 10m
  utc
</match>
```
# License
Apache License, Version 2.0

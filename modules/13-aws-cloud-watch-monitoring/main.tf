 /*
 data "aws_instances" "all" {
  # Additional filters if needed
 }

 locals {
   instance_ids = toset(data.aws_instances.all.ids)
 }
*/

resource "aws_sns_topic" "notification_topic" {
  name = "MyNotificationTopic"
}


# 2. SNS Topic Subscription Creation:

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.notification_topic.arn
  protocol  = "email"
  endpoint  = "mohanram.m2.subramaniyan@pccw.com"
  endpoint_auto_confirms = true
}


resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
 # for_each = local.instance_ids   # data.aws_instances.all.ids

  alarm_name          = "CPUAlarm-" # ${each.key}
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "10"
  alarm_description   = "Alarm when CPU utilization exceeds 80% for 2 periods"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  alarm_actions       = [aws_sns_topic.notification_topic.arn]
  dimensions = {
  InstanceId =  "i-07df55631f5dbc517"
  # each.key
     
  }
}

resource "aws_cloudwatch_metric_alarm" "memory_alarm" {
  #for_each = local.instance_ids   # data.aws_instances.all.ids

  alarm_name          = "MemoryAlarm-" # ${each.key}
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "10"
  alarm_description   = "Alarm when memory utilization exceeds 70% for 2 periods"
  metric_name         = "MemoryUtilization"
  namespace           = "System/Linux"
  period              = "300"
  statistic           = "Average"
  alarm_actions       = [aws_sns_topic.notification_topic.arn]
  dimensions = {
    InstanceId = "i-07df55631f5dbc517"
    #each.key
  }
}



resource "aws_cloudwatch_metric_alarm" "disk_alarm" {
  #for_each = local.instance_ids

  alarm_name          = "DiskAlarm-" #${each.key}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  threshold           = 70
  alarm_description   = "Alarm when disk usage exceeds 90% for 2 periods"
  metric_name         = "LogicalDisk % Free Space"  # Metric name for Windows
  namespace           = "CWAgent"  # Namespace for Windows
  period              = 60
  statistic           = "Average"
  alarm_actions       = [aws_sns_topic.notification_topic.arn]
  dimensions = {
    InstanceId =  "i-07df55631f5dbc517"
    FileSystem = "*"
    # each.key
  }
}






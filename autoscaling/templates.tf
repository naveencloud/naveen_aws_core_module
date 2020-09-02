data "template_file" "core_asg_cfn" {
  template = file("${path.module}/files/cloudformationbluegreen.json")
  
  vars = {
    AutoScalingGroupName    = var.asg_name
    MinSize                 = var.asg_min_size
    MaxSize                 = var.asg_max_size
    DesiredCapacity         = var.asg_desired_capacity
    HealthCheckType         = var.health_check_type
    HealthCheckGracePeriod  = var.health_check_grace_period
    Cooldown                = var.default_cooldown
    TargetGroupARN          = var.tg_arn
    TerminationPolicies     = var.termination_policies
    VPCZoneIdentifier1      = var.VPCZoneIdentifier1
	VPCZoneIdentifier2      = var.VPCZoneIdentifier2
    Metrics                 = var.enabled_metrics
    OnDemandAllocationStrategy = var.OnDemandAllocationStrategy
    OnDemandBaseCapacity    = var.on_demand_base_capacity
    OnDemandPercentageAboveBaseCapacity = var.on_demand_percentage_above_base_capacity
    SpotAllocationStrategy   = var.spot_allocation_strategy
    SpotInstancePools        = var.spot_instance_pools
    SpotMaxPrice             = var.spot_max_price
    LaunchTemplateId         = var.launch_template_id
    Version                  = var.launch_template_version
    SpotInstanceType1 = var.spot_instance_type1
    ec2_name      = var.ec2_name
    Environment   = var.environment
    cnf_asg_resourcename = var.cnf_asg_resourcename
   }
 }
   
   
   
   
   
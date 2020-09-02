#!/bin/bash
/opt/aws/bin/cfn-signal -e 0 --stack ${cf_StackName} --resource ${cf_resource_id} --region ${region}

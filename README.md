# hmpps-delius-transit-gateway
Transit Gateway implementation for delius environments connections to other non delius accounts

Full docs available in Confluence at https://dsdmoj.atlassian.net/wiki/spaces/DAM/pages/2043740219/delius+AWS+account+integration+with+3rd+parties 

#### Current 3rd Party to delius connectivity via transit gateway
- delius to cloudplatform
- delius to analytics platform

#### Implementation

- Apply the transit-gateway-common configuration

#### Jenkins Jobs

| Stage         | Jenkins Job | Jenkinsfile                                                  |
|---------------|-------------|--------------------------------------------------------------|
| common        | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/00-Common-Apply/            | apply_transit_gateway_config_common.Jenkinsfile              |
| cloudplatform | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/01-Cloudplatform-Apply/            | apply_transit_gateway_config_cloudplatform.Jenkinsfile       |
| analytics     | https://jenkins.engineering-dev.probation.hmpps.dsd.io/job/Ops/job/Delius-TransitGateway-Connections/job/01-AnalyticsPlatforms-Apply/            | apply_transit_gateway_config_analytics_platforms.Jenkinsfile |
# Module: Bastion

A module for add bastion funtionality to existing VPC

* Output Resources
    * A security group for bastion instances
    * A bastionEC2 instance
    * An attachment of bastion security group to existing VPC subnets

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bastion\_ami\_id | ami id for bastion instances | `string` | `"ami-0bea7fd38fabe821a"` | no |
| bastion\_cidr\_blocks | cidr blocks for bastion instances | `list` | n/a | yes |
| bastion\_key\_pair | key pair for bastion instances | `string` | n/a | yes |
| bastion\_ssh\_port | port number for bastion instances | `number` | `22` | no |
| bastion\_subnet\_id | subnet id for bastion instances | `string` | n/a | yes |
| bastion\_type | bastion instance type | `string` | `"t2.micro"` | no |
| tags | tags | `map(string)` | `{}` | no |
| vpc\_id | target vpc id | `string` | n/a | yes |
| vpc\_sg\_id\_private | vpc security id for private subnets | `string` | n/a | yes |
| vpc\_sg\_id\_public | vpc security id for public subnets | `string` | n/a | yes |
| vpc\_tags | vpc additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_public\_dns | public dns addr of bastion instance |


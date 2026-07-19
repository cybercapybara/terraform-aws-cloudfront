# terraform-aws-cloudfront

Terraform module that manages an [Amazon
CloudFront](https://aws.amazon.com/cloudfront/) distribution. It creates a
single distribution in front of a custom origin with sensible caching and
HTTPS defaults, exposing the distribution domain name for DNS aliasing.

## Usage

```hcl
module "cloudfront" {
  source = "github.com/moveeeax/terraform-aws-cloudfront"

  origin_domain_name = "assets.example.com"

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                     | Description                                             | Type           | Default                | Required |
|--------------------------|---------------------------------------------------------|----------------|------------------------|:--------:|
| `comment`                | Comment describing the distribution.                    | `string`       | `"Managed by Terraform"` | no     |
| `enabled`                | Whether the distribution accepts traffic.               | `bool`         | `true`                 |    no    |
| `default_root_object`    | Object returned for the root URL.                       | `string`       | `"index.html"`         |    no    |
| `price_class`            | Price class controlling edge locations.                 | `string`       | `"PriceClass_100"`     |    no    |
| `origin_domain_name`     | DNS domain name of the origin.                          | `string`       | n/a                    |   yes    |
| `origin_id`              | Unique identifier for the origin.                       | `string`       | `"default-origin"`     |    no    |
| `viewer_protocol_policy` | Protocol policy viewers must use.                       | `string`       | `"redirect-to-https"`  |    no    |
| `allowed_methods`        | HTTP methods CloudFront processes.                      | `list(string)` | `["GET", "HEAD"]`      |    no    |
| `cached_methods`         | HTTP methods CloudFront caches.                         | `list(string)` | `["GET", "HEAD"]`      |    no    |
| `aliases`                | Alternate domain names served.                          | `list(string)` | `[]`                   |    no    |
| `tags`                   | Tags applied to the distribution.                       | `map(string)`  | `{}`                   |    no    |

## Outputs

| Name             | Description                                        |
|------------------|----------------------------------------------------|
| `id`             | ID of the distribution.                            |
| `arn`            | ARN of the distribution.                           |
| `domain_name`    | Domain name assigned to the distribution.          |
| `hosted_zone_id` | Route 53 hosted zone ID for aliasing.              |
| `status`         | Current status of the distribution.                |

## License

[MIT](LICENSE)

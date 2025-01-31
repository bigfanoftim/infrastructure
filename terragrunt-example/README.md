# Example infrastructure for Terragrunt

이 저장소는 Terragrunt를 이용하여 AWS 인프라를 관리하기 위한 구성을 담고 있습니다.

Terragrunt는 Terraform 구성을 DRY(Don't Repeat Yourself)하게 작성할 수 있도록 도와주는 도구입니다. 
Terragrunt를 활용해 여러 개발 환경과 리전을 구조화하고 Terraform의 복잡한 설정을 쉽게 관리할 수 있도록 구성하였습니다.

## 디렉토리 구조

```
infrastructure
├── README.md
├── bigfanoftim
│   ├── _global
│   │   └── region.hcl
│   ├── account.hcl
│   └── ap-northeast-2
│       ├── _global
│       │   └── env.hcl
│       ├── dev
│       │   ├── env.hcl
│       │   └── network
│       │       └── vpc
│       │           └── terragrunt.hcl
│       └── region.hcl
├── modules
│   └── network
│       └── vpc
│           ├── outputs.tf
│           ├── resources.tf
│           └── variables.tf
└── terragrunt.hcl
```

[How is the code in this repo organized?](https://github.com/gruntwork-io/terragrunt-infrastructure-live-example?tab=readme-ov-file#how-is-the-code-in-this-repo-organized)
를 참조하여 실무 프로젝트에 적용해 본 경험을 바탕으로, 최종적으로 위와 같은 디렉토리 구조를 선택했습니다.

## 모듈 배포

### 단일 모듈

1. 모듈을 구현하는 디렉토리로 이동
    ```bash
    $ cd infrastructure/ap-northeast-2/dev/network/vpc
    ```
2. 변경 확인 및 적용
    ```bash
    $ terragrunt plan
    $ terragrunt apply
    ```
### 리전 내 모든 모듈

1. 배포할 리전 디렉토리로 이동
    ```bash
    $ cd infrastructure/ap-northeast-2
    ```
2. 변경 확인 및 적용
    ```bash
    $ terragrunt run-all plan
    $ terragrunt run-all apply
    ```

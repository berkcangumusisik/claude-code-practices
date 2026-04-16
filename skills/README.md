# Skill Kütüphanesi / Skill Library

[← Ana Sayfa](../README.md) · [Dil Desteği](./_LANGUAGE_SUPPORT.md)

> Aşağıdaki skill'leri `.claude/skills/` klasörüne kopyalayın ve `/komut-adı` ile kullanın.  
> Copy any skill below into `.claude/skills/` and invoke with `/command-name`.

**Dil notu:** Tüm skill'ler Türkçe ve İngilizce çalışır. Detaylar: [Dil Desteği](./_LANGUAGE_SUPPORT.md)

---

## Kurulum / Installation

```bash
# Tüm skill'leri kopyala / Copy all skills
cp -r skills/ .claude/skills/

# Tek skill / Single skill
cp -r skills/fix-issue .claude/skills/
```

---

## Git & Versiyon Kontrolü / Git & Version Control

| Skill | Komut | Açıklama |
|---|---|---|
| [fix-issue](fix-issue/SKILL.md) | `/fix-issue <number>` | GitHub issue'sunu okur, ilgili kodu bulur, düzeltir ve commit hazırlar |
| [pr-review](pr-review/SKILL.md) | `/pr-review [number]` | Güvenlik, test, performans ve doğruluk açısından PR inceler |
| [pr-create](pr-create/SKILL.md) | `/pr-create [base]` | Mevcut branch'ten PR oluşturur, title ve description üretir |
| [commit](commit/SKILL.md) | `/commit` | Staged değişikliklerden Conventional Commit mesajı yazar |
| [release-notes](release-notes/SKILL.md) | `/release-notes [version]` | Son tag'den bu yana commit'lerden release notları üretir |
| [changelog](changelog/SKILL.md) | `/changelog` | CHANGELOG.md'yi son commit'lerle günceller |
| [branch-cleanup](branch-cleanup/SKILL.md) | `/branch-cleanup` | Merge edilmiş stale branch'leri listeler ve temizler |
| [git-stats](git-stats/SKILL.md) | `/git-stats [author]` | Katkı istatistikleri, hotspot dosyalar, commit desenleri |
| [merge-conflict](merge-conflict/SKILL.md) | `/merge-conflict` | Tüm merge conflict'leri bulur ve çözümler |
| [cherry-pick](cherry-pick/SKILL.md) | `/cherry-pick <description>` | Açıklama ile commit arar ve cherry-pick yapar |
| [tag-release](tag-release/SKILL.md) | `/tag-release <major\|minor\|patch>` | Versiyon bumper ve git tag oluşturur |
| [git-blame-explain](git-blame-explain/SKILL.md) | `/git-blame-explain <file> [lines]` | Satırların neden yazıldığını commit geçmişiyle açıklar |
| [breaking-changes](breaking-changes/SKILL.md) | `/breaking-changes <base>` | İki ref arası breaking change'leri tespit eder |

---

## Test

| Skill | Komut | Açıklama |
|---|---|---|
| [test-runner](test-runner/SKILL.md) | `/test-runner [pattern]` | Testleri çalıştırır, hataları analiz eder, düzeltme önerir |
| [test-generate](test-generate/SKILL.md) | `/test-generate <file>` | Dosya veya fonksiyon için unit testler yazar |
| [test-coverage](test-coverage/SKILL.md) | `/test-coverage` | Coverage raporu çalıştırır, eksik testleri üretir |
| [test-e2e](test-e2e/SKILL.md) | `/test-e2e <flow>` | Playwright/Cypress ile E2E test üretir |
| [snapshot-update](snapshot-update/SKILL.md) | `/snapshot-update` | Snapshot diff'leri gözden geçirir, seçici günceller |
| [test-perf](test-perf/SKILL.md) | `/test-perf <target>` | Benchmark/performans testleri yazar |
| [test-mutation](test-mutation/SKILL.md) | `/test-mutation <file>` | Test kalitesini mutation analizi ile ölçer |

---

## Kod Kalitesi & Refactor / Code Quality & Refactor

| Skill | Komut | Açıklama |
|---|---|---|
| [refactor](refactor/SKILL.md) | `/refactor <file>` | Davranışı değiştirmeden kod kalitesini iyileştirir |
| [extract-function](extract-function/SKILL.md) | `/extract-function <file> <lines>` | Kod bloğunu adlandırılmış fonksiyona çıkarır |
| [dead-code](dead-code/SKILL.md) | `/dead-code` | Kullanılmayan fonksiyon, export ve değişkenleri bulur |
| [type-fix](type-fix/SKILL.md) | `/type-fix [file]` | TypeScript tip hatalarını düzeltir |
| [lint-fix](lint-fix/SKILL.md) | `/lint-fix` | Tüm lint hatalarını düzeltir |
| [complexity-report](complexity-report/SKILL.md) | `/complexity-report [dir]` | Cyclomatic complexity hotspot'larını raporlar |
| [duplicate-finder](duplicate-finder/SKILL.md) | `/duplicate-finder [dir]` | Tekrarlı kodu bulur ve ortak soyutlama önerir |
| [rename-symbol](rename-symbol/SKILL.md) | `/rename-symbol <old> <new>` | Sembolü tüm codebase'de güvenli yeniden adlandırır |

---

## Dokümantasyon / Documentation

| Skill | Komut | Açıklama |
|---|---|---|
| [jsdoc](jsdoc/SKILL.md) | `/jsdoc <file>` | Tüm public fonksiyon ve tiplere JSDoc ekler |
| [readme-update](readme-update/SKILL.md) | `/readme-update` | README'yi projenin güncel durumuna göre günceller |
| [api-docs](api-docs/SKILL.md) | `/api-docs [routes-dir]` | Route tanımlarından API dokümantasyonu üretir |
| [inline-comments](inline-comments/SKILL.md) | `/inline-comments <file>` | Karmaşık kod bölümlerine açıklayıcı yorum ekler |
| [openapi-gen](openapi-gen/SKILL.md) | `/openapi-gen` | Mevcut route'lardan OpenAPI 3.0 spec üretir |

---

## Güvenlik / Security

| Skill | Komut | Açıklama |
|---|---|---|
| [security-audit](security-audit/SKILL.md) | `/security-audit [target]` | OWASP Top 10 odaklı güvenlik denetimi |
| [secret-scan](secret-scan/SKILL.md) | `/secret-scan` | Kod tabanında sızan credential'ları tarar |
| [dependency-audit](dependency-audit/SKILL.md) | `/dependency-audit` | CVE ve güncel olmayan paketleri denetler |

---

## Performans / Performance

| Skill | Komut | Açıklama |
|---|---|---|
| [perf-audit](perf-audit/SKILL.md) | `/perf-audit [target]` | N+1 query, gereksiz re-render, blocking op bulur |
| [bundle-analyze](bundle-analyze/SKILL.md) | `/bundle-analyze` | Bundle boyutunu analiz eder, optimizasyon önerir |
| [query-optimize](query-optimize/SKILL.md) | `/query-optimize [file]` | DB sorgularını optimize eder, index önerir |
| [memory-leak](memory-leak/SKILL.md) | `/memory-leak [target]` | Memory leak kaynaklarını tespit eder |

---

## Frontend

| Skill | Komut | Açıklama |
|---|---|---|
| [component-gen](component-gen/SKILL.md) | `/component-gen <Name> [desc]` | React/Vue/Svelte component üretir (test + story) |
| [react-hook](react-hook/SKILL.md) | `/react-hook <name> [desc]` | Custom React hook üretir |
| [form-gen](form-gen/SKILL.md) | `/form-gen <description>` | Validasyonlu, erişilebilir form üretir |
| [tailwind-cleanup](tailwind-cleanup/SKILL.md) | `/tailwind-cleanup [dir]` | Kullanılmayan Tailwind class'larını temizler |
| [state-audit](state-audit/SKILL.md) | `/state-audit [dir]` | Prop drilling, redundant state, eksik memo bulur |
| [seo-check](seo-check/SKILL.md) | `/seo-check [page]` | Next.js/React SEO denetimi - meta, OG, structured data |
| [lighthouse-fix](lighthouse-fix/SKILL.md) | `/lighthouse-fix [target]` | Lighthouse skoru düşüren sorunları düzeltir |
| [accessibility-audit](accessibility-audit/SKILL.md) | `/accessibility-audit [dir]` | WCAG 2.1 erişilebilirlik denetimi |
| [i18n-check](i18n-check/SKILL.md) | `/i18n-check [dir]` | Hardcoded string'leri bulur, çeviri key'leri üretir |

---

## Backend

| Skill | Komut | Açıklama |
|---|---|---|
| [api-endpoint](api-endpoint/SKILL.md) | `/api-endpoint <METHOD> <path>` | Validasyon + auth + test ile route scaffold'lar |
| [auth-middleware](auth-middleware/SKILL.md) | `/auth-middleware <strategy>` | JWT/session/api-key auth middleware üretir |
| [rate-limiter](rate-limiter/SKILL.md) | `/rate-limiter [endpoint]` | Redis destekli rate limiting ekler |
| [error-handler](error-handler/SKILL.md) | `/error-handler` | Typed hata sınıfları ve global handler üretir |
| [caching-strategy](caching-strategy/SKILL.md) | `/caching-strategy [target]` | Redis/in-memory/HTTP cache stratejisi ekler |
| [rest-api-design](rest-api-design/SKILL.md) | `/rest-api-design <resource>` | REST API tasarlar veya mevcut olanı gözden geçirir |
| [graphql-schema](graphql-schema/SKILL.md) | `/graphql-schema <entity>` | GraphQL schema + resolver + DataLoader üretir |
| [websocket-handler](websocket-handler/SKILL.md) | `/websocket-handler <feature>` | WebSocket handler + client hook üretir |
| [cron-job](cron-job/SKILL.md) | `/cron-job <description> [schedule]` | Locking + logging ile cron job üretir |
| [openapi-gen](openapi-gen/SKILL.md) | `/openapi-gen` | OpenAPI 3.0 spec üretir |

---

## Veritabanı / Database

| Skill | Komut | Açıklama |
|---|---|---|
| [migration-gen](migration-gen/SKILL.md) | `/migration-gen <change>` | DB migration dosyası üretir (up + down) |
| [migration-run](migration-run/SKILL.md) | `/migration-run` | Bekleyen migration'ları çalıştırır ve doğrular |
| [seed-data](seed-data/SKILL.md) | `/seed-data [entity]` | Gerçekçi seed data üretir |
| [schema-review](schema-review/SKILL.md) | `/schema-review` | DB schema normalizasyon ve index denetimi |
| [query-optimize](query-optimize/SKILL.md) | `/query-optimize [file]` | N+1 ve over-fetching sorunlarını giderir |
| [sql-explain](sql-explain/SKILL.md) | `/sql-explain <query>` | SQL sorgusunu açıklar ve optimize eder |

---

## Mobile (React Native / Expo)

| Skill | Komut | Açıklama |
|---|---|---|
| [react-native-component](react-native-component/SKILL.md) | `/react-native-component <Name>` | Platform-aware, erişilebilir RN component üretir |
| [mobile-perf](mobile-perf/SKILL.md) | `/mobile-perf [dir]` | FlatList, re-render, bridge call sorunlarını bulur |
| [mobile-deeplink](mobile-deeplink/SKILL.md) | `/mobile-deeplink [scheme]` | Deep linking ve Universal Links kurar |
| [expo-setup](expo-setup/SKILL.md) | `/expo-setup [platform]` | EAS Build, OTA updates ve CI/CD kurar |

---

## DevOps & CI/CD

| Skill | Komut | Açıklama |
|---|---|---|
| [docker-build](docker-build/SKILL.md) | `/docker-build` | Multi-stage Dockerfile oluşturur veya optimize eder |
| [github-actions](github-actions/SKILL.md) | `/github-actions [type]` | CI/CD workflow üretir |
| [deploy-check](deploy-check/SKILL.md) | `/deploy-check` | Deploy öncesi hazırlık kontrol listesi |
| [env-setup](env-setup/SKILL.md) | `/env-setup` | .env.example ve startup validasyonu üretir |
| [env-check](env-check/SKILL.md) | `/env-check` | Gerekli env variable'ları doğrular |

---

## Mimari & Analiz / Architecture & Analysis

| Skill | Komut | Açıklama |
|---|---|---|
| [tech-debt](tech-debt/SKILL.md) | `/tech-debt` | Teknik borç denetimi ve önceliklendirilmiş backlog |
| [dep-graph](dep-graph/SKILL.md) | `/dep-graph [entry]` | Circular import ve coupling sorunlarını tespit eder |
| [impact-analysis](impact-analysis/SKILL.md) | `/impact-analysis <file>` | Değişikliğin neyi etkileyeceğini haritalandırır |
| [complexity-report](complexity-report/SKILL.md) | `/complexity-report` | Cyclomatic complexity hotspot raporu |

---

## Geliştirici Deneyimi / Developer Experience

| Skill | Komut | Açıklama |
|---|---|---|
| [setup-project](setup-project/SKILL.md) | `/setup-project` | Yeni geliştiricileri onboard eder, kurulum yapar |
| [mock-gen](mock-gen/SKILL.md) | `/mock-gen <Type>` | Test için mock factory ve MSW handler üretir |
| [util-function](util-function/SKILL.md) | `/util-function <description>` | Tip güvenli, testli utility fonksiyonu üretir |
| [deps-update](deps-update/SKILL.md) | `/deps-update` | Bağımlılıkları güvenli günceller |
| [deps-unused](deps-unused/SKILL.md) | `/deps-unused` | Kullanılmayan paketleri bulur ve kaldırır |
| [log-analyze](log-analyze/SKILL.md) | `/log-analyze [file]` | Log çıktısını analiz eder, root cause bulur |
| [debug-helper](debug-helper/SKILL.md) | `/debug-helper <error>` | Root cause analizi yapar ve düzeltir |

---

## Kendi Skill'ini Yaz / Write Your Own

```
.claude/skills/
└── my-skill/
    └── SKILL.md
```

```yaml
---
name: my-skill
description: Ne yapar
argument-hint: <arg>
user-invocable: true
allowed-tools: Read Edit Bash(git *)
---

$ARGUMENTS ile ne yapacağını yaz...
```

→ [Katkıda Bulunma Rehberi](../CONTRIBUTING.md#skill-katkısı--contributing-a-skill)

---

<sub>Toplam / Total: 60+ skill</sub>

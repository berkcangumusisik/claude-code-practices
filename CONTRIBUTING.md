# Katkıda Bulunma Rehberi / Contributing Guide

[← Ana Sayfa / Home](README.md)

Bu projeye katkıda bulunmak harika! Aşağıda nasıl başlayacağını bulabilirsin.  
Contributions are welcome! Here's how to get started.

---

## Ne Katkıda Bulunabilirsin? / What Can You Contribute?

| Tür / Type | Örnekler / Examples |
|---|---|
| Yeni skill | Farklı iş akışları için SKILL.md şablonları |
| Çeviri düzeltmesi | TR veya EN dokümanlarında hata düzeltme |
| Hook tarifi | Yararlı hook konfigürasyonları |
| İpucu / Tip | Token optimizasyonu, iş akışı iyileştirmesi |
| Hata bildirimi | Yanlış veya eksik bilgi |

---

## Nasıl Başlamalı? / How to Start?

### 1. Fork ve Clone

```bash
# Repoyu fork et (GitHub'da sağ üst köşe)
# Fork the repo (top-right on GitHub)

git clone https://github.com/<kullanıcı-adın>/claude-code-practices
cd claude-code-practices
```

### 2. Branch Oluştur / Create a Branch

```bash
# Yeni skill eklemek için / For new skill
git checkout -b skill/skill-adi

# Doküman düzeltmesi için / For documentation fix
git checkout -b docs/fix-typo-in-hooks

# Hook tarifi için / For hook recipe
git checkout -b recipe/auto-lint-hook
```

### 3. Değişikliklerini Yap / Make Your Changes

Aşağıdaki kural listelerini oku, sonra değişikliklerini yap.

---

## Skill Katkısı / Contributing a Skill

Yeni bir skill eklemek istiyorsan:

```
skills/
└── skill-adin/
    └── SKILL.md
```

### SKILL.md Şablonu

```yaml
---
name: skill-adin
description: Ne yaptığını tek cümleyle açıkla
argument-hint: <zorunlu-arg> [isteğe-bağlı]
user-invocable: true
allowed-tools: Read Edit Bash(git *)
effort: medium
---

Skill talimatları...

$ARGUMENTS ile kullanıcının argümanını al.
```

### Kontrol Listesi / Checklist

- [ ] `name` kısa ve anlaşılır (kebab-case)
- [ ] `description` menüde güzel görünüyor
- [ ] `allowed-tools` minimumda tutulmuş
- [ ] Talimatlar net ve sıralı
- [ ] `skills/README.md` tablosuna eklendi
- [ ] Ana `README.md` tablosuna eklendi

---

## Doküman Katkısı / Contributing Documentation

### Türkçe Doküman
Düzenle: [`tr/README.md`](tr/README.md)

### İngilizce Doküman
Düzenle: [`en/README.md`](en/README.md)

### Her iki dile de ekle
Yeni bir bölüm ekliyorsan hem `tr/README.md` hem de `en/README.md` güncellenmeli.  
If adding a new section, update both `tr/README.md` and `en/README.md`.

---

## Hook Tarifi Katkısı / Contributing Hook Recipes

Hooks bölümüne yeni tarif eklemek için ilgili dil dosyasını düzenle ve şu formatı kullan:

```markdown
#### Tarif Başlığı / Recipe Title

Kısa açıklama.

```json
{
  "hooks": {
    "EventName": [...]
  }
}
```

---

## Commit Mesajları / Commit Messages

[Conventional Commits](https://www.conventionalcommits.org/) formatını kullan:

```
feat(skills): add deploy-preview skill
fix(tr): correct shortcut for model switching
docs(en): update MCP server configuration examples
refactor(skills): simplify fix-issue argument handling
```

| Prefix | Kullanım / Use |
|---|---|
| `feat` | Yeni skill veya özellik / New skill or feature |
| `fix` | Hata düzeltmesi / Bug fix |
| `docs` | Yalnızca doküman / Documentation only |
| `refactor` | Yeniden yapılandırma / Restructure |
| `chore` | Bakım / Maintenance |

---

## Pull Request Açma / Opening a Pull Request

1. Fork'undaki branch'i push et
2. GitHub'da "New Pull Request" tıkla
3. Başlık net olsun: `feat(skills): add deploy-preview skill`
4. Açıklamada ne eklediğini/değiştirdiğini yaz
5. Eğer bir issue'ya yanıt veriyorsa: `Closes #123`

### PR Şablonu / PR Template

```markdown
## Ne Yaptım / What I Did
- 

## Test Ettim / How I Tested
- [ ] Skill'i gerçek bir projede denedim
- [ ] Doküman linklerinin çalıştığını kontrol ettim

## İlgili Issue / Related Issue
Closes #
```

---

## Soru? / Questions?

Issue aç veya Discussion başlat, her katkı değerlidir.  
Open an issue or start a Discussion — every contribution matters.

---

[← Ana Sayfa / Home](README.md)

# Claude Code — Türkçe Kapsamlı Rehber

[← Ana Sayfa](../README.md) · [English](../en/README.md) · [Skills](../skills/README.md)

---

## İçindekiler

1. [Klavye Kısayolları](#1-klavye-kısayolları)
2. [Slash Komutları](#2-slash-komutları)
3. [Token Optimizasyonu](#3-token-optimizasyonu)
4. [CLAUDE.md](#4-claudemd)
5. [Settings.json](#5-settingsjson)
6. [Hooks Sistemi](#6-hooks-sistemi)
7. [Skills](#7-skills)
8. [MCP Sunucuları](#8-mcp-sunucuları)
9. [İzin Modları](#9-i̇zin-modları)
10. [Subagents](#10-subagents)
11. [CLI Bayrakları](#11-cli-bayrakları)
12. [Ortam Değişkenleri](#12-ortam-değişkenleri)
13. [En İyi Pratikler](#13-en-i̇yi-pratikler)

---

## 1. Klavye Kısayolları

### Genel Kontroller

| Kısayol | Açıklama |
|---|---|
| `Ctrl+C` | Mevcut işlemi iptal et |
| `Ctrl+D` | Oturumu kapat |
| `Ctrl+L` | Giriş alanını temizle (geçmiş korunur) |
| `Ctrl+R` | Komut geçmişinde geriye ara |
| `Ctrl+T` | Görev listesini aç/kapat |
| `Ctrl+O` | Transkripti görüntüle |
| `Ctrl+G` / `Ctrl+X Ctrl+E` | Promptu harici editörde aç |
| `Ctrl+V` / `Cmd+V` | Panodan görüntü yapıştır |
| `Esc + Esc` | Konuşmayı geri sar / özetle |
| `Shift+Tab` / `Alt+M` | İzin modunu döngüyle değiştir |
| `Option+P` | Model değiştir |
| `Option+T` | Extended thinking aç/kapat |
| `Option+O` | Fast mode aç/kapat |
| `↑ / ↓` | Komut geçmişinde gezin |
| `← / →` | Dialog sekmeleri arasında geç |
| `Ctrl+X Ctrl+K` | Tüm arka plan ajanlarını durdur |

### Metin Düzenleme

| Kısayol | Açıklama |
|---|---|
| `Ctrl+K` | İmleçten satır sonuna kadar sil |
| `Ctrl+U` | İmleçten satır başına kadar sil |
| `Ctrl+Y` | Silinen metni yapıştır |
| `Alt+B` | Bir kelime geri git |
| `Alt+F` | Bir kelime ileri git |

### Çok Satırlı Giriş

| Yöntem | Terminal |
|---|---|
| `\` + `Enter` | Tüm terminaller |
| `Shift+Enter` | iTerm2, WezTerm, Ghostty, Kitty |
| `Option+Enter` | macOS varsayılan |
| `Ctrl+J` | Herhangi bir terminal |

### Kısayol Özelleştirme

```bash
# Kısayol yapılandırma dosyasını aç
/keybindings
```

```json
// ~/.claude/keybindings.json
{
  "bindings": [
    { "context": "Chat", "key": "ctrl+s", "action": "submit" },
    { "context": "Global", "key": "ctrl+k ctrl+s", "action": "clear" }
  ]
}
```

> `Ctrl+C`, `Ctrl+D`, `Ctrl+M` yeniden atanamaz.

---

## 2. Slash Komutları

### Oturum Yönetimi

| Komut | Açıklama |
|---|---|
| `/clear` | Konuşma geçmişini temizle |
| `/compact` | Bağlamı sıkıştır |
| `/compact [odak]` | Odaklı sıkıştırma: `/compact Sadece kod değişikliklerine odaklan` |
| `/rename [isim]` | Oturumu yeniden adlandır |
| `/resume` | Önceki oturumu devam ettir |
| `/rewind` | Önceki kontrol noktasına dön |
| `/memory` | Bellek dosyalarını görüntüle/düzenle |
| `/cost` | Token kullanımı ve maliyeti göster |
| `/status` | Oturum durumunu göster |
| `/context` | Bağlam penceresi kullanımını göster |

### Yapılandırma

| Komut | Açıklama |
|---|---|
| `/config` | Ayarlar menüsünü aç |
| `/model` | Model değiştir |
| `/effort` | Çaba seviyesini ayarla (low / medium / high / max) |
| `/init` | Proje için CLAUDE.md başlat |
| `/terminal-setup` | Shift+Enter çok satırlı girişi yapılandır |
| `/mcp` | MCP sunucularını yönet |
| `/hooks` | Yapılandırılmış hook'ları görüntüle |
| `/agents` | Alt ajanları listele |
| `/plugins` | Plugin'leri yönet |
| `/keybindings` | Kısayolları özelleştir |
| `/permission-mode` | İzin modunu değiştir |

### Diğer Komutlar

| Komut | Açıklama |
|---|---|
| `/help` | Yardım göster |
| `/release-notes` | Sürüm notlarını görüntüle |
| `/doctor` | Tanılama çalıştır |
| `/vim` | Vim modunu aç/kapat |
| `/fast` | Fast mode aç/kapat |
| `/plan` | Plan moduna gir |
| `/btw [soru]` | Geçici yan soru (geçmişe kaydedilmez) |
| `!komut` | Bash komutunu doğrudan çalıştır |

---

## 3. Token Optimizasyonu

### Bağlam Azaltma Stratejileri

**1. Görevler arası `/clear`**
İlgisiz görevlere geçerken geçmişi temizle. Eski bağlam yeni görevlere karışmasın.

**2. Odaklı `/compact`**
```
/compact Sadece değişen fonksiyonları ve test çıktısını tut
```

**3. Spesifik prompt yaz**
```
# Kötü — geniş tarama tetikler
"Bu projeyi iyileştir"

# İyi — odaklı çalışma
"src/auth/login.ts:142 satırındaki login() fonksiyonuna email validasyonu ekle"
```

**4. Extended thinking bütçesini düşür**
```bash
MAX_THINKING_TOKENS=4000 claude
```

**5. Subagent izolasyonu**
Ağır işlemleri (log analizi, büyük dosya taraması) alt ajanlara delege et. Yalnızca özet dönsün.

**6. CLAUDE.md'yi 200 satırın altında tut**
Ayrıntılı iş akışlarını skills'e taşı — skill'ler yalnızca çağrıldığında yüklenir.

**7. Kullanılmayan MCP sunucularını devre dışı bırak**
```bash
/mcp  # Yönetim panelini aç
```

### .claudeignore

```gitignore
# .claudeignore
node_modules/
dist/
build/
*.log
.env
coverage/
*.lock
*.min.js
```

### Model Seçim Kılavuzu

| Model | Ne Zaman Kullan |
|---|---|
| `claude-haiku-4-5` | Basit subagent görevleri, tekrar eden işler |
| `claude-sonnet-4-6` | Çoğu kodlama görevi — varsayılan seçim |
| `claude-opus-4-6` | Karmaşık mimari kararlar, zor algoritmalar |

---

## 4. CLAUDE.md

### Dosya Konumları ve Kapsam

| Konum | Kapsam | Git'te? |
|---|---|---|
| `~/.claude/CLAUDE.md` | Tüm projeler (kullanıcı) | Hayır |
| `./CLAUDE.md` | Proje kökü | Evet |
| `./.claude/CLAUDE.md` | Proje (alternatif) | Evet |
| `./CLAUDE.local.md` | Kişisel yerel tercihler | Hayır |
| `/Library/Application Support/ClaudeCode/CLAUDE.md` | Organizasyon geneli | Evet (yönetici) |

### Öncelik Sırası

```
Managed Policy
    └── Proje CLAUDE.md
            └── Kullanıcı CLAUDE.md
                    └── CLAUDE.local.md
                            └── Alt dizin CLAUDE.md (gerektiğinde yüklenir)
```

### Import Sözdizimi

```markdown
@README.md
@docs/architecture.md
@~/.claude/shared-rules.md
```

- İlk harici kullanımda onay penceresi açılır
- Maksimum 5 seviye özyineleme
- Oturum başlangıcında genişletilir

### Örnek CLAUDE.md

```markdown
# Proje Adı

## Komutlar
- Build: `bun run build`
- Test: `bun test`
- Lint: `bun run lint`
- Tip kontrolü: `bun run typecheck`

## Kod Standartları
- 2 boşluk girintileme
- TypeScript strict mode
- `console.log` yerine proje logger'ı kullan: `import { logger } from '@/lib/logger'`
- Async işlemler için Promise zinciri değil async/await

## Mimari
@docs/architecture.md

## Yasaklar
- `npm` kullanma, her zaman `bun` kullan
- `any` type kullanma
- Test dosyalarında `only` bırakma
```

### Modüler Yapı

```
.claude/
├── CLAUDE.md                  # Ana talimatlar (@import kullan)
├── rules/
│   ├── code-style.md
│   ├── testing.md
│   ├── api-design.md
│   └── frontend/
│       └── react.md
```

### Yol Kapsamlı Kurallar

```markdown
---
paths:
  - "src/api/**/*.ts"
---

# API Kuralları
- Tüm endpoint'ler Zod ile input validasyonu içermeli
- Rate limiting middleware'i dahil et
```

### Belirli CLAUDE.md Dosyalarını Hariç Tut

```json
// .claude/settings.local.json
{
  "claudeMdExcludes": [
    "**/legacy/.claude/rules/**"
  ]
}
```

---

## 5. Settings.json

### Dosya Konumları

| Konum | Kapsam | Git'te? |
|---|---|---|
| `~/.claude/settings.json` | Global kullanıcı | Hayır |
| `.claude/settings.json` | Proje | Evet |
| `.claude/settings.local.json` | Yerel kişisel | Hayır |

**Öncelik:** Managed > Project > User > Local

### Tüm Ayar Anahtarları

```json
{
  "model": "claude-sonnet-4-6",
  "modelAliases": { "fast": "claude-haiku-4-5" },
  "effort": "medium",
  "thinkingBudget": 8000,
  "disableThinking": false,

  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Bash(git *)",
      "Bash(bun *)",
      "Edit(src/**/*.ts)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(curl * | bash)",
      "Bash(sudo *)"
    ]
  },

  "autoMemoryEnabled": true,
  "ignoreGitignore": false,

  "env": {
    "NODE_ENV": "development"
  },

  "hooks": {}
}
```

---

## 6. Hooks Sistemi

### Mevcut Hook Olayları

| Olay | Ne Zaman | Engelleyebilir? |
|---|---|---|
| `SessionStart` | Oturum başlar | Hayır |
| `UserPromptSubmit` | Prompt işlenmeden önce | Hayır |
| `PreToolUse` | Araç çalışmadan önce | **Evet** |
| `PostToolUse` | Araç başarıyla çalıştıktan sonra | Hayır |
| `PostToolUseFailure` | Araç başarısız olduktan sonra | Hayır |
| `PermissionRequest` | İzin diyalogu açılınca | **Evet** |
| `Notification` | Claude girdi bekliyorken | Hayır |
| `Stop` | Claude yanıt bitirince | Hayır |
| `SubagentStop` | Alt ajan bitince | Hayır |
| `PreCompact` | Sıkıştırmadan önce | Hayır |
| `PostCompact` | Sıkıştırmadan sonra | Hayır |
| `SessionEnd` | Oturum kapanınca | Hayır |

### Hook Yapısı

```json
// .claude/settings.json
{
  "hooks": {
    "OlayAdı": [
      {
        "matcher": "AraçAdı|DiğerAraç",
        "hooks": [
          {
            "type": "command",
            "command": "komut buraya",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

### Çıkış Kodları

| Kod | Davranış |
|---|---|
| `0` | İşlem devam eder; stdout bağlama eklenir |
| `2` | **İşlem engellenir;** stderr Claude'a geri bildirim olur |
| Diğer | İşlem devam eder; hata loglanır |

### Hazır Hook Tarifleri

#### Bildirim — Claude Seni Bekliyor

```json
{
  "hooks": {
    "Notification": [{
      "matcher": "",
      "hooks": [{
        "type": "command",
        "command": "osascript -e 'display notification \"Claude seni bekliyor\" with title \"Claude Code\"'"
      }]
    }]
  }
}
```

#### Otomatik Prettier

```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Edit|Write",
      "hooks": [{
        "type": "command",
        "command": "jq -r '.tool_input.file_path // empty' | xargs -I{} npx prettier --write {} 2>/dev/null || true"
      }]
    }]
  }
}
```

#### Korumalı Dosyaları Engelle

```bash
#!/bin/bash
# ~/.claude/hooks/protect-files.sh
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
if [[ "$FILE" == *".env"* ]] || [[ "$FILE" == *"secrets"* ]]; then
  echo "Korumalı dosya değiştirilemez: $FILE" >&2
  exit 2
fi
exit 0
```

```json
{
  "hooks": {
    "PreToolUse": [{
      "matcher": "Edit|Write",
      "hooks": [{ "type": "command", "command": "~/.claude/hooks/protect-files.sh" }]
    }]
  }
}
```

#### Sıkıştırma Sonrası Bağlam Yenile

```json
{
  "hooks": {
    "PostCompact": [{
      "hooks": [{
        "type": "command",
        "command": "cat .claude/context-reminder.md"
      }]
    }]
  }
}
```

#### Test Çıktısını Filtrele (Token Tasarrufu)

```bash
#!/bin/bash
# Sadece başarısız testleri göster
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
if [[ "$COMMAND" == *"test"* ]]; then
  eval "$COMMAND" 2>&1 | grep -E "FAIL|Error|✗|×|failed" || echo "Tüm testler geçti ✓"
  exit 0
fi
echo "$INPUT"
```

---

## 7. Skills

Skills, `/komut-adı` şeklinde çağrılabilen yeniden kullanılabilir iş akışlarıdır.

### Skill Konumları

| Konum | Kapsam | Paylaşımlı? |
|---|---|---|
| `~/.claude/skills/<ad>/SKILL.md` | Tüm projeler | Hayır |
| `.claude/skills/<ad>/SKILL.md` | Proje | Evet (git) |

### SKILL.md Frontmatter

```yaml
---
name: skill-adi
description: Ne yapar — menüde görünür
argument-hint: <arg1> [arg2]
user-invocable: true
allowed-tools: Bash(git *) Edit Read
model: claude-sonnet-4-6
effort: medium
context: fork
---
```

### Yer Tutucular

| Yer Tutucu | Açıklama |
|---|---|
| `$ARGUMENTS` | Tüm argümanlar |
| `$ARGUMENTS[0]` veya `$1` | İlk argüman |
| `${CLAUDE_SESSION_ID}` | Mevcut oturum ID'si |
| `${CLAUDE_SKILL_DIR}` | Skill dizini |

### Dinamik Bağlam Enjeksiyonu

```markdown
---
name: pr-review
---

## PR Durumu
- Diff: !`gh pr diff`
- Yorumlar: !`gh pr view --comments`
- CI: !`gh pr checks`

PR'ı incele ve sorunları listele...
```

→ Hazır skill örnekleri için: [../skills/](../skills/)

---

## 8. MCP Sunucuları

### Sunucu Ekleme

```bash
# CLI ile
claude mcp add stdio /yol/sunucu
claude mcp add sse https://api.example.com/mcp

# Yönet
claude mcp list
claude mcp remove sunucu-adı
```

### Settings.json ile Yapılandırma

```json
{
  "mcpServers": {
    "github": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "$GH_TOKEN" }
    },
    "filesystem": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/proje/yolu"]
    }
  }
}
```

### İzin Kuralları

```json
{
  "permissions": {
    "allow": ["mcp__github__*", "mcp__filesystem__read_file"],
    "deny": ["mcp__github__delete_repository"]
  }
}
```

**Araç adlandırma:** `mcp__<sunucu>__<araç>` — örn. `mcp__github__search_repositories`

---

## 9. İzin Modları

| Mod | Otomatik Onay | Kullanım Senaryosu |
|---|---|---|
| `default` | Yalnızca okuma | Hassas işler, ilk keşif |
| `acceptEdits` | Okuma + düzenleme + güvenli bash | Kod iterasyonu |
| `plan` | Yalnızca okuma (değişiklik önerir) | Uygulamadan önce inceleme |
| `auto` | Her şey + sınıflandırıcı | Uzun, güvenilir görevler |
| `dontAsk` | Yalnızca önceden onaylananlar | CI pipeline |
| `bypassPermissions` | Her şey | İzole VM/konteyner |

### Mod Değiştirme

```bash
# Başlangıçta
claude --permission-mode plan

# Oturum içinde
Shift+Tab
```

### Korumalı Yollar (Hiçbir Zaman Otomatik Onaylanmaz)

```
.git/  .vscode/  .idea/  .gitconfig  .gitmodules
.bashrc  .zshrc  .profile  .env  .mcp.json
```

### Özel İzin Kuralları

```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Bash(git *)",
      "Bash(bun *)",
      "Bash(npx *)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(curl * | bash)",
      "Bash(sudo *)"
    ]
  }
}
```

---

## 10. Subagents

### Dahili Türler

| Tür | Açıklama |
|---|---|
| `Explore` | Salt okunur keşif ve araştırma |
| `Plan` | Planlama ve analiz |
| `general-purpose` | Genel amaçlı görevler |

### Özel Subagent

```yaml
# .claude/agents/code-reviewer.md
---
name: code-reviewer
description: Kod kalitesi ve güvenlik incelemesi
model: claude-sonnet-4-6
tools: Read Grep Bash(npm test)
permissionMode: plan
---

Kod inceleyicisisin. Şunlara odaklan:
- Güvenlik açıkları
- Test kapsamı eksiklikleri
- Performans sorunları
- Kod tekrarı
```

### Paralel Subagentlar

```bash
# Agent Teams deneysel özelliği
CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude

# Paralel worktree çalışması
claude -w feature-auth "Auth sistemini implement et"
claude -w feature-api  "REST API endpoint'lerini yaz"
```

---

## 11. CLI Bayrakları

### Oturum Yönetimi

```bash
claude                              # İnteraktif oturum
claude "başlangıç promptu"          # Promptla başlat
claude -p "sorgu"                   # Non-interaktif (print mode)
claude -c                           # Son oturumu devam ettir
claude -r "oturum-adı"              # İsimli oturumu devam ettir
claude -n "adım"                    # Oturumu adlandır
```

### Model ve Çaba

```bash
claude --model sonnet
claude --model opus
claude --model claude-haiku-4-5
claude --effort high
claude --effort low "Yazım hatası düzelt"
```

### Dosya Erişimi

```bash
claude --add-dir ../apps ../lib
claude --allowedTools "Bash(git *)" "Edit(*.ts)"
claude --disallowedTools "Bash(rm *)"
```

### Girdi/Çıktı

```bash
claude -p --output-format json "sorgu"
cat logs.txt | claude -p "Hataları bul ve özetle"
claude --system-prompt "Sen bir güvenlik uzmanısın"
```

### Worktree

```bash
claude -w feature-branch
claude -w feature --tmux
```

---

## 12. Ortam Değişkenleri

| Değişken | Açıklama | Örnek |
|---|---|---|
| `MAX_THINKING_TOKENS` | Thinking bütçesi | `4000` |
| `CLAUDE_CODE_DEBUG_LOGS_DIR` | Debug log dizini | `/tmp/claude-logs` |
| `CLAUDE_CODE_DISABLE_AUTO_MEMORY` | Otomatik belleği kapat | `1` |
| `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` | Agent teams özelliği | `1` |
| `CLAUDE_CODE_TASK_LIST_ID` | Adlandırılmış görev listesi | `proje-adı` |
| `CLAUDE_SESSION_ID` | Oturum ID'sini geçersiz kıl | UUID |
| `CLAUDE_ENV_FILE` | Hook ortam değişkenleri dosyası | `/tmp/claude.env` |
| `CLAUDE_CODE_SIMPLE` | Minimal mod | `1` |

---

## 13. En İyi Pratikler

### Etkili Prompt Yazımı

```
✅ "src/auth/login.ts:87'deki validateEmail() fonksiyonuna RFC 5322 kontrolü ekle"
✅ "Tüm React component'larında prop-types eksikliğini bul ve ekle — src/components/"
✅ "package.json'daki bağımlılıkları güncelle, breaking change olanları listele"

❌ "Kodu düzelt"
❌ "Daha iyi yap"
❌ "Bak ne sorun var"
```

### Günlük İş Akışı

```bash
# 1. Göreve başlarken
claude -n "auth-refactor" --permission-mode acceptEdits

# 2. Karmaşık değişiklik öncesi
/plan

# 3. Çalışma sırasında token tasarrufu
/compact Sadece auth modülündeki değişiklikleri tut

# 4. Görev bitiminde
/cost    # Harcamayı gör
/clear   # Sonraki görev için temizle
```

### CLAUDE.md Kontrol Listesi

- [ ] Build, test, lint komutları
- [ ] Kullanılan framework/kütüphane versiyonları
- [ ] Yasaklı araçlar (ör. npm yerine bun)
- [ ] Dosya/klasör kuralları
- [ ] Ekip spesifik sözleşmeler
- [ ] 200 satır altında — fazlasını @import ile çek

### Hook'larla Otomasyon

```
Kaydet → Prettier (PostToolUse)
Değiştir → Lint kontrolü (PostToolUse)
Başla → Bağlam yükle (SessionStart)
Compact → Önemli kuralları yeniden inject et (PostCompact)
Bekle → Bildirim gönder (Notification)
```

---

[← Ana Sayfa](../README.md) · [English](../en/README.md) · [Skills →](../skills/README.md)

<div align="center">

# Claude Code Practices

</div>

---

Claude Code'u kullanmaya başladığımda ilk hafta şunu yazdım:

*"Bu projeyi iyileştir."*

Claude 4 dosya okudu, 2 dosyayı değiştirdi, birini bozdu. 34.000 token harcadı. Hiçbir şey düzelmedi.

`/cost` yazdım. $0.09 harcamıştım. Sıfır iş karşılığında.

---

Son 1 ayda neyin işe yarayıp neyin yaramadığını öğrenmek için ciddi zaman harcadım. Bu repo o deneyimin özeti.

Sonuç olarak aynı işi şimdi **%60-70 daha az token** ile yapıyorum.

---

## Önce Bunları Bil

### 1. Prompt ne kadar spesifik olursa maliyet o kadar düşük

```
# Kötü — 34.000 token
"Bu projeyi iyileştir"

# İyi — 4.000 token
"src/auth/login.ts:87 satırındaki validateEmail() fonksiyonuna RFC 5322 kontrolü ekle"
```

Fark: **8.5 kat.** Aynı sonuç, sekizde bir maliyet.

---

### 2. `/compact` yanlış kullanılınca işe yaramıyor

```bash
# Neredeyse hiçbir şey kesmez
/compact

# Bağlamın %70'ini keser, iş kalitesi düşmez
/compact Keep only changed functions and relevant test output
```

Uzun bir oturumda bunu iki kez kullandım. Token sayısı 82.000'den 11.000'e indi.

---

### 3. `.claudeignore` olmadan Claude gereksiz dosyalara bakıyor

```gitignore
node_modules/
dist/
*.log
coverage/
*.lock
```

Bu 6 satır, Claude'un okuduğu dosya sayısını projeye göre **3 ila 10 kat azaltıyor.**

---

## Repoda Ne Var

### [Skill Kütüphanesi](skills/README.md)

82 hazır slash command. `.claude/skills/` klasörüne kopyala, `/komut-adı` ile kullan.

```bash
cp -r skills/ .claude/skills/
```

| Kategori | Adet | Örnekler |
|---|---|---|
| Git & GitHub | 13 | `/fix-issue`, `/pr-review`, `/commit`, `/release-notes` |
| Test | 7 | `/test-generate`, `/test-coverage`, `/test-e2e` |
| Frontend | 9 | `/component-gen`, `/seo-check`, `/state-audit` |
| Backend | 10 | `/api-endpoint`, `/auth-middleware`, `/rate-limiter` |
| Mobile | 4 | `/react-native-component`, `/mobile-perf`, `/expo-setup` |
| Güvenlik | 3 | `/security-audit`, `/secret-scan`, `/dependency-audit` |
| Veritabanı | 6 | `/migration-gen`, `/query-optimize`, `/schema-review` |
| Daha fazlası | ... | [Tümünü gör](skills/README.md) |

---

### [Türkçe Rehber](tr/README.md) · [English Guide](en/README.md)

Kısayollar, slash komutları, hook tarifleri, CLAUDE.md yapısı, izin modları. Hepsi tek dosyada.

### [Cheatsheet](CHEATSHEET.md)

Bookmark'lanacak tek sayfalık hızlı referans.

---

## Nereden Başlamalı

**Yeni başlıyorsan** → [Cheatsheet](CHEATSHEET.md)'e göz at, bir skill kopyala, dene.

**Token maliyetin yüksekse** → [Token optimizasyonu](tr/README.md#3-token-optimizasyonu)

**Aynı promptları tekrar yazıyorsan** → [Skills](skills/README.md)

**Ekibinle paylaşmak istiyorsan** → [CLAUDE.md şablonları](tr/README.md#4-claudemd)

---

## Katkı

Daha iyi bir yöntem bulduysan, yeni bir skill yazdıysan veya hata gördüysen PR aç.

[CONTRIBUTING.md](CONTRIBUTING.md)

---

<div align="center">
<sub>Faydalı olduysa ⭐ bırak, başkasının bulmasına yardım eder.</sub>
</div>

# Dil Desteği / Language Support

Tüm skill'ler otomatik olarak **hem Türkçe hem İngilizce** çalışır.

Claude ile Türkçe konuşuyorsan, skill talimatları da Türkçe olarak uygulanır.  
If you use English with Claude, skill instructions execute in English.

---

## Türkçe Kullanım Örneği

```
/fix-issue 42
```

Claude şunu anlayacak: "42 numaralı issue'yu bul, kodda ilgili yeri tespit et, düzelt ve commit hazırla."  
Türkçe açıklama istersen: `/fix-issue 42 - Türkçe açıkla`

---

## Dili Zorlamak / Force Language

Her skill'in başına ekleyebilirsin:

```
/security-audit - yanıtı Türkçe ver
/pr-review - respond in English
/refactor src/auth.ts - auf Deutsch erklären
```

---

## Skill'lere Türkçe Bağlam Eklemek

`CLAUDE.md` dosyana ekle:

```markdown
## Dil Tercihi
Tüm açıklamaları Türkçe yaz. Kod ve değişken isimleri İngilizce kalsın.
```

Bu ayarla tüm skill çıktıları otomatik Türkçe olur.

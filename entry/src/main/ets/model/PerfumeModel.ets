export interface Perfume {
  name: string;
  image: Resource;
  category: string;
  description: string;
}

export const dummyPerfume: Perfume[] = [
  {
    name: 'Velvet Bloom',
    image: $r('app.media.dummyperfume1'),
    category: 'Romantic',
    description: 'A soft and romantic floral blend with delicate notes of peony, freesia, and white musk. Velvet Bloom wraps you in a gentle, powdery bouquet that evokes the feeling of freshly bloomed petals on a warm spring morning. The subtle sweetness of the flowers is balanced by the clean, comforting depth of white musk, creating a fragrance that is both timeless and graceful. Perfect for quiet evenings, special occasions, or any moment you wish to feel effortlessly elegant and serene.'
  },
  {
    name: 'Noim Timber',
    image: $r('app.media.dummyperfume2'),
    category: 'Masculine',
    description: 'Inspired by the depths of the forest, Noim Timber captures the essence of nature with a rich blend of warm sandalwood and robust cedarwood. This earthy composition is gently uplifted by a subtle hint of musk, adding a touch of sensuality and depth. Evoking the tranquility of a woodland escape, the scent unfolds gradually, lingering on the skin with long-lasting intensity. Noim Timber is a sophisticated and masculine fragrance designed for those who find peace and strength in nature. Each spray immerses you in the serene ambiance of a quiet forest, offering a refined and grounding olfactory experience.'
  },
  {
    name: 'Citrus Muse',
    image: $r('app.media.dummyperfume3'),
    category: 'Unisex',
    description: 'Bursting with radiant energy, Citrus Muse is a lively symphony of juicy grapefruit, tangy lime zest, and a splash of sun-kissed mandarin. This invigorating blend awakens your senses with an immediate burst of vibrant freshness, reminiscent of a bright summer morning. As the citrus notes unfold, they reveal a playful yet refined character—perfect for those who embrace life with spontaneity and joy. Crisp, clean, and undeniably uplifting, Citrus Muse is a modern celebration of zestful charm and effervescent spirit, leaving a refreshing trail that lingers throughout the day.'
  },
  {
    name: 'Midnight Ember',
    image: $r('app.media.dummyperfume4'),
    category: 'Night',
    description: 'Midnight Ember combines smoky incense, patchouli, and a touch of cinnamon.'
  },
  {
    name: 'Autumn Whisper',
    image: $r('app.media.dummyperfume5'),
    category: 'Seasonal',
    description: 'Inspired by the serene beauty of crisp fall evenings, Autumn Whisper is a delicate composition that captures the quiet magic of the season. A harmonious blend of dry woods and golden amber forms the warm heart of the fragrance, while a gentle hint of sage adds a touch of aromatic freshness. The scent evokes the rustle of leaves underfoot, the golden light of early twilight, and the comforting stillness in the air. Subtle yet soulful, Autumn Whisper is an earthy, nostalgic fragrance that wraps you in calm and reflection—perfect for those who find beauty in the changing seasons.'
  },
]
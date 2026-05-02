export interface Perfume {
  id: string;
  name: string;
  image: Resource;
  category: string;
  description: string;
}

export const dummyPerfume: Perfume[] = [
  {
    id: 'velvet_bloom',
    name: 'Velvet Bloom',
    image: $r('app.media.dummyperfume1'),
    category: 'Romantic',
    description: 'A soft and romantic floral blend with delicate notes of peony, freesia, and white musk. Velvet Bloom wraps you in a gentle, powdery bouquet that evokes the feeling of freshly bloomed petals on a warm spring morning. The subtle sweetness of the flowers is balanced by the clean, comforting depth of white musk, creating a fragrance that is both timeless and graceful. Perfect for quiet evenings, special occasions, or any moment you wish to feel effortlessly elegant and serene.'
  },
  {
    id: 'noim_timber',
    name: 'Noim Timber',
    image: $r('app.media.dummyperfume2'),
    category: 'Masculine',
    description: 'Inspired by the depths of the forest, Noim Timber captures the essence of nature with a rich blend of warm sandalwood and robust cedarwood. This earthy composition is gently uplifted by a subtle hint of musk, adding a touch of sensuality and depth. Evoking the tranquility of a woodland escape, the scent unfolds gradually, lingering on the skin with long-lasting intensity. Noim Timber is a sophisticated and masculine fragrance designed for those who find peace and strength in nature.'
  },
  {
    id: 'citrus_muse',
    name: 'Citrus Muse',
    image: $r('app.media.dummyperfume3'),
    category: 'Unisex',
    description: 'Bursting with radiant energy, Citrus Muse is a lively symphony of juicy grapefruit, tangy lime zest, and a splash of sun-kissed mandarin. This invigorating blend awakens your senses with an immediate burst of vibrant freshness, reminiscent of a bright summer morning. Crisp, clean, and undeniably uplifting, Citrus Muse is a modern celebration of zestful charm and effervescent spirit, leaving a refreshing trail that lingers throughout the day.'
  }
];

export const defaultPerfume: Perfume = {
  id: '',
  name: '',
  image: $r('app.media.dummyperfume1'),
  category: '',
  description: ''
};

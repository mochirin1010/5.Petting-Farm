module ApplicationHelper
  def default_meta_tags
    {
      site: 'Petting Farm',
      title: 'ペットの写真を投稿するサイト',
      reverse: true,
      separator: '|',
      description: 'ペットの写真を自由に投稿するサイトです。Petting Farm = "動物園のふれあいコーナー" という意味です。写真をたくさん投稿することによって、動物とのふれあいをより身近に感じられるようなサイトをみんなで作っていきましょう！',
      keywords: 'pet, ペット, ペット投稿, 写真投稿',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('/img/favicon_pet.ico') },
        { href: image_url('/img/pet_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: 'Petting Farm',
        title: 'ペットの写真を投稿するサイト',
        description: 'ペットの写真を自由に投稿するサイトです。Petting Farm = "動物園のふれあいコーナー" という意味です。写真をたくさん投稿することによって、動物とのふれあいをより身近に感じられるようなサイトをみんなで作っていきましょう！',
        type: 'website',
        url: request.original_url,
        image: image_url('/img/pet_icon.png'),
        locale: 'ja_JP'
      }
    }
  end
end

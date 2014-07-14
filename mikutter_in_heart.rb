# -*- coding: utf-8 -*-

Plugin.create(:mikutter_in_heart) do
  command(
    :mikutter_in_heart,
    name: '心の声で呟く',
    condition: Plugin::Command[:Editable],
    visible: false,
    role: :postbox
    ) do |op|
    buff = Plugin.create(:gtk).widgetof(op.widget).widget_post.buffer
    if (buff.text.length > 129)
      buff.text = buff.text[0..124] + "..."
    end
    buff.text = "（´-`）.｡oO（#{buff.text}）"
    op.widget.post_it!
  end
end

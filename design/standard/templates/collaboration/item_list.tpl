<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
  <th colspan="4">{"Subject"|i18n('design/standard/collaboration')}</th>
  <th>{"Date"|i18n('design/standard/collaboration')}</th>
</tr>
{section name=Item loop=$item_list sequence=array(bglight,bgdark)}
{let item_class="status_read"}
<tr>
  <td class="{$:sequence}" width="1">
    {section show=$:item.user_status.is_active}
      {section show=$:item.user_status.is_read}
      <img src={"collaboration/status_read.png"|ezimage} alt="{'Read'|i18n('design/standard/collaboration')}" />
      {section-else}
      {set item_class="status_unread"}
      <img src={"collaboration/status_unread.png"|ezimage} alt="{'Unread'|i18n('design/standard/collaboration')}" />
      {/section}
    {section-else}
    {set item_class="status_inactive"}
    <img src={"collaboration/status_inactive.png"|ezimage} alt="{'Inactive'|i18n('design/standard/collaboration')}" />
    {/section}
  </td>
  <td class="{$:sequence}" width="1">
    <a href={concat("collaboration/item/full/",$:item.id)|ezurl}>{collaboration_icon view=small collaboration_item=$:item}</a>
  </td>
  <td class="{$:sequence}">
    {collaboration_view_gui view=line item_class=$:item_class collaboration_item=$:item}
    {section show=and($:item.use_messages,$:item.unread_message_count)}
    <p><b><a href={concat("collaboration/item/full/",$:item.id,"#messages")|ezurl}>({$:item.unread_message_count})</a></b></p>
    {section-else}
    &nbsp;
    {/section}
  </td>
  <td class="{$:sequence}">
    <p><nobr><a href={concat("collaboration/item/full/",$:item.id)|ezurl}>[more]</a></nobr></p>
  </td>
  <td class="{$:sequence}" width="1">
    <p><nobr>{$:item.created|l10n(shortdatetime)}</nobr></p>
  </td>
</tr>
{/let}
{/section}
</table>

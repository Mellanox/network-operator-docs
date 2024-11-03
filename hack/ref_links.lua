local anchors = {}

function Header(el)
  if el.level == 3 and el.identifier then
    local ref_name = el.identifier:match("[^.]+$")
    el.identifier = ref_name
    return {
      el
    }
  end
end

function Link(el)
  local href = el.target
  if href:match("^https://kubernetes%.io") then
    return el  -- Do nothing, return the original link
  end
  if href:match("^https://godoc") then
    return el  -- Do nothing, return the original link
  end
  if href:match("^https://network.nvidia.com") then
    return el  -- Do nothing, return the original link
  end
  if href:match("^https://github.com") then
    return el  -- Do nothing, return the original link
  end
  if href:match("^https://docs.nvidia.com") then
    return el  -- Do nothing, return the original link
  end
  -- Check if the link is "#mellanox.com%2fv1alpha1"
  if href:match("mellanox%.com%%2fv*") then
    -- Update the href to be the correct path
    local ref_name = el.content[1].text
    return pandoc.RawInline('rst', string.format(":ref:`%s <%s>`", el.content[1].text, ref_name))
  end
  -- Remove asterisks from around the link text if present
  local link_text = el.content[1].text:gsub("^%*", ""):gsub("%*$", "")
  -- Remove the leading '#' if present
  href = href:gsub("^#", "")
  -- Create the ref name (use the last part of the href)
  local ref_name = href:match("[^.]+$")
  
  -- Return the :ref: style link
  return pandoc.RawInline('rst', string.format(":ref:`%s <%s>`", el.content[1].text, ref_name))
end

function Doc(doc)
  return doc
end

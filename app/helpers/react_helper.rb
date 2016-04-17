module ReactHelper
  def react_component(component, id, props)
    script = generate_script(component, id, props)
    "<div id='#{id}'></div>#{script}".html_safe
  end


  private

  def generate_script(component, id, props)
    "<script>
      document.addEventListener('DOMContentLoaded', function(ev) {
        renderReact('#{component}', '#{id}', #{props.to_json});
      });
    </script>"
  end
end

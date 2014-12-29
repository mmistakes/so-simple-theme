---
layout: page
title: Contact
permalink: /contact/
---

<form action="https://getsimpleform.com/messages?form_api_token=5b9e593db65741162d035bb288769583" method="post">
  <!-- the redirect_to is optional, the form will redirect to the referrer on submission -->
  <input type='hidden' name='redirect_to' value='{{ site.url }}/contact' />
  <!-- all your input fields here.... -->
  Name
  <input type='text' name='name' />
  Email
  <input type='text' name='email' />
  Subject
  <input type='text' name='subject' />
  Message
  <textarea name="message"></textarea>
  <input type='submit' value='Send' />
</form>

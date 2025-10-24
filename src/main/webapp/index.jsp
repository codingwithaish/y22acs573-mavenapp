<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Student Registration Form</title>
  <style>
    :root{
      --bg:#f6f8fb; --card:#ffffff; --accent:#4f46e5; --muted:#6b7280;
      --danger:#dc2626; --success:#16a34a;
      --radius:12px; font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    html,body{height:100%; margin:0; background:linear-gradient(180deg,#eef2ff 0%, var(--bg) 100%);}
    .container{max-width:920px; margin:36px auto; padding:20px;}
    .card{
      background:var(--card); border-radius:var(--radius); box-shadow:0 6px 24px rgba(15,23,42,0.08);
      padding:20px;
    }
    h1{margin:0 0 8px; font-size:20px;}
    p.lead{margin:0 0 18px; color:var(--muted); font-size:14px;}
    form{display:grid; gap:14px;}
    .grid{display:grid; grid-template-columns:repeat(2,1fr); gap:12px;}
    @media (max-width:700px){ .grid{grid-template-columns:1fr;} }
    label{display:block; font-size:13px; margin-bottom:6px; color:#111827;}
    input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="password"], select, textarea {
      width:100%; padding:10px 12px; font-size:14px; border-radius:8px; border:1px solid #e6e9ef;
      background:#fbfdff; box-sizing:border-box;
    }
    textarea{min-height:92px; resize:vertical; padding-top:10px;}
    .row{display:flex; gap:12px; align-items:center;}
    .radio-group{display:flex; gap:12px; align-items:center;}
    .small{font-size:13px; color:var(--muted);}
    .file-preview{width:96px; height:96px; border-radius:8px; object-fit:cover; border:1px dashed #e6e9ef;}
    .actions{display:flex; gap:10px; justify-content:flex-end; margin-top:6px;}
    button{background:var(--accent); color:white; border:none; padding:10px 14px; border-radius:10px; font-weight:600; cursor:pointer;}
    button.secondary{background:transparent; color:var(--accent); border:1px solid rgba(79,70,229,0.12);}
    .note{font-size:13px; color:var(--muted);}
    .error{color:var(--danger); font-size:13px;}
    .success{color:var(--success); font-size:13px;}
    .form-foot{display:flex; justify-content:space-between; align-items:center; gap:10px; flex-wrap:wrap;}
    .required{color:var(--danger); margin-left:4px;}
    input:invalid{outline:2px solid rgba(220,38,38,0.06);}
  </style>
</head>
<body>
  <div class="container">
    <div class="card" role="region" aria-labelledby="formTitle">
      <h1 id="formTitle">Student Registration</h1>
      <p class="lead">Fill in the form to register. Fields marked with <span class="required">*</span> are required.</p>

      <form id="regForm" novalidate>
        <div class="grid">
          <div>
            <label for="firstName">First Name <span class="required">*</span></label>
            <input id="firstName" name="firstName" type="text" autocomplete="given-name" required minlength="2" placeholder="Asha">
          </div>

          <div>
            <label for="lastName">Last Name <span class="required">*</span></label>
            <input id="lastName" name="lastName" type="text" autocomplete="family-name" required minlength="1" placeholder="Patel">
          </div>

          <div>
            <label for="dob">Date of Birth <span class="required">*</span></label>
            <input id="dob" name="dob" type="date" required>
          </div>

          <div>
            <label>Gender <span class="required">*</span></label>
            <div class="radio-group" role="radiogroup" aria-labelledby="genderLabel">
              <label><input type="radio" name="gender" value="Female" required> Female</label>
              <label><input type="radio" name="gender" value="Male"> Male</label>
              <label><input type="radio" name="gender" value="Other"> Other</label>
            </div>
          </div>

          <div>
            <label for="email">Email <span class="required">*</span></label>
            <input id="email" name="email" type="email" autocomplete="email" required placeholder="you@example.com">
          </div>

          <div>
            <label for="phone">Phone <span class="required">*</span></label>
            <input id="phone" name="phone" type="tel" pattern="^\+?\d{7,15}$" required placeholder="+919876543210">
            <div class="small">Include country code optionally. Only digits and leading + allowed.</div>
          </div>

          <div style="grid-column:1 / -1">
            <label for="address">Address</label>
            <textarea id="address" name="address" placeholder="House no, Street, City, State, PIN"></textarea>
          </div>

          <div>
            <label for="course">Course <span class="required">*</span></label>
            <select id="course" name="course" required>
              <option value="">Choose a course</option>
              <option>BSc Computer Science</option>
              <option>BCom</option>
              <option>BA</option>
              <option>Diploma in Engineering</option>
              <option>MBA</option>
            </select>
          </div>

          <div>
            <label for="year">Year / Semester <span class="required">*</span></label>
            <select id="year" name="year" required>
              <option value="">Select</option>
              <option>1st Year</option>
              <option>2nd Year</option>
              <option>3rd Year</option>
              <option>4th Year</option>
            </select>
          </div>

          <div>
            <label for="roll">Roll / Student ID <span class="required">*</span></label>
            <input id="roll" name="roll" type="text" required placeholder="STU2025-001">
          </div>

          <div>
            <label for="photo">Profile Photo</label>
            <input id="photo" name="photo" type="file" accept="image/*">
            <div style="margin-top:8px;"><img id="preview" class="file-preview" alt="photo preview" aria-hidden="true"></div>
          </div>

          <div>
            <label for="password">Password <span class="required">*</span></label>
            <input id="password" name="password" type="password" required minlength="6" placeholder="At least 6 characters">
          </div>

          <div>
            <label for="confirm">Confirm Password <span class="required">*</span></label>
            <input id="confirm" name="confirm" type="password" required minlength="6" placeholder="Re-enter password">
            <div id="passMsg" class="small" aria-live="polite"></div>
          </div>
        </div>

        <div class="form-foot" style="margin-top:6px;">
          <label style="display:flex; gap:8px; align-items:center;">
            <input id="terms" name="terms" type="checkbox" required> I agree to the <a href="#" onclick="return false">terms & conditions</a> <span class="required">*</span>
          </label>

          <div class="actions" style="margin-left:auto;">
            <button type="reset" class="secondary" id="resetBtn">Reset</button>
            <button type="submit" id="submitBtn">Register</button>
          </div>
        </div>

        <div id="status" role="status" aria-live="polite"></div>
      </form>
    </div>
  </div>

  <script>
    // Elements
    const form = document.getElementById('regForm');
    const password = document.getElementById('password');
    const confirm = document.getElementById('confirm');
    const passMsg = document.getElementById('passMsg');
    const preview = document.getElementById('preview');
    const photoInput = document.getElementById('photo');
    const statusBox = document.getElementById('status');

    // Password match check (live)
    function checkPasswordMatch(){
      if(!password.value && !confirm.value){ passMsg.textContent = ''; return; }
      if(password.value === confirm.value){
        passMsg.textContent = 'Passwords match.';
        passMsg.className = 'success';
      } else {
        passMsg.textContent = 'Passwords do not match.';
        passMsg.className = 'error';
      }
    }
    password.addEventListener('input', checkPasswordMatch);
    confirm.addEventListener('input', checkPasswordMatch);

    // Photo preview
    photoInput.addEventListener('change', (e) => {
      const file = e.target.files[0];
      if(!file){ preview.src=''; preview.style.display='none'; return; }
      if(!file.type.startsWith('image/')){ preview.src=''; preview.style.display='none'; return; }
      const reader = new FileReader();
      reader.onload = () => {
        preview.src = reader.result;
        preview.style.display = 'block';
      };
      reader.readAsDataURL(file);
    });

    // Basic phone pattern validation helper
    function validPhone(ph){
      if(!ph) return false;
      return /^\+?\d{7,15}$/.test(ph.trim());
    }

    // Form submission
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      statusBox.textContent = ''; statusBox.className = '';

      // HTML5 validity check
      if(!form.checkValidity()){
        form.reportValidity();
        return;
      }

      // Password match check
      if(password.value !== confirm.value){
        passMsg.textContent = 'Passwords do not match.';
        passMsg.className = 'error';
        confirm.focus();
        return;
      }

      // Phone check
      const phoneVal = document.getElementById('phone').value;
      if(!validPhone(phoneVal)){
        statusBox.textContent = 'Please enter a valid phone number (7–15 digits, optional leading +).';
        statusBox.className = 'error';
        document.getElementById('phone').focus();
        return;
      }

      // Prepare form data for submission (example)
      const data = new FormData(form);

      // Example: convert to JSON for demonstration (excluding file)
      const payload = {};
      for (const [k,v] of data.entries()){
        if(k === 'photo') continue;
        payload[k] = v;
      }

      // Simulate success (replace with actual fetch() to back-end)
      console.log('Form payload (example):', payload);
      statusBox.textContent = 'Registration successful — form data logged to console (demo).';
      statusBox.className = 'success';

      // Optionally, reset the form after success:
      // form.reset();
      // preview.src = '';
      // passMsg.textContent = '';
    });

    // Reset handler to clear preview and messages
    document.getElementById('resetBtn').addEventListener('click', () => {
      preview.src = '';
      preview.style.display = 'none';
      passMsg.textContent = '';
      statusBox.textContent = '';
    });

    // Small accessibility nicety: set max date for DOB to ensure realistic birthdates (optional)
    (function setMaxDOB(){
      const dob = document.getElementById('dob');
      const today = new Date();
      // Students must be at least 10 years old and not born in the future (adjust as needed)
      const yyyy = today.getFullYear() - 10;
      const mm = String(today.getMonth()+1).padStart(2,'0');
      const dd = String(today.getDate()).padStart(2,'0');
      dob.max = `${yyyy}-${mm}-${dd}`;
    })();
  </script>
</body>
</html>

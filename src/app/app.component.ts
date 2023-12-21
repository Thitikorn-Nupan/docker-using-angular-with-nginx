import { Component } from '@angular/core';
/* If ng module does not have
*  when build angular just use
*  ng new <> --no-standalone */
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  standalone:true,
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'build-basic-webapp-using-angular';
}

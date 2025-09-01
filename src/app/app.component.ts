import { Component } from '@angular/core';
import {NgForOf, NgIf} from "@angular/common";


/**
  If ng module does not have (it's meaning you are working on standalone app)
  So if you don't want standalone app  when build angular just use ng new <> --no-standalone
*/
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  standalone: true,
  imports: [
    NgForOf,
    NgIf
  ],
  styleUrl: './app.component.css'
})
export class AppComponent {

  protected readonly title : string = 'Angular + Docker'
  protected readonly routerLinks : {label : string,route : string}[] = [
    {label : 'Home' , route :''},
    {label : 'Both List' , route :''},
    {label : 'Employee List' , route :''},
    {label : 'Employee Form' , route :''},
  ]
}

import {NgModule} from "@angular/core";
import {AppComponent} from "./app.component";
import {AppRoutes} from "./app.routes";
@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    AppRoutes
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

}

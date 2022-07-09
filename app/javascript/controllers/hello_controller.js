import { Controller } from "@hotwired/stimulus"
import "select2"

export default class extends Controller {
  initialize() {
    $('.select2').select2();
  }
}
// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
lazyLoadControllersFrom("controllers", application)

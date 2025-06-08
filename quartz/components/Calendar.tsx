// @ts-ignore  
import calendarScript from "./scripts/calendar.inline"  
import { QuartzComponent, QuartzComponentConstructor } from "./types"  
  
const Calendar: QuartzComponent = () => {  
  return <></>  
}  
  
Calendar.afterDOMLoaded = calendarScript  
  
export default (() => Calendar) satisfies QuartzComponentConstructor
const changeCalendarTheme = (e: CustomEventMap["themechange"]) => {  
  const theme = e.detail.theme  
  const calendarIframes = document.querySelectorAll("iframe[src*='calendar.google.com']")  
    
  //calendarIframes.forEach((iframe: HTMLIFrameElement) => {  
  calendarIframes.forEach((element) => {  
    const iframe = element as HTMLIFrameElement;
    if (iframe.src) {  
      const url = new URL(iframe.src)  
      // Googleカレンダーのテーマパラメータを更新  
      url.searchParams.set('color', theme === 'dark' ? '%23333333' : '%23ffffff')  
      url.searchParams.set('bgcolor', theme === 'dark' ? '%23000000' : '%23ffffff')  
      iframe.src = url.toString()  
    }  
  })  
}  
  
// 初期テーマの設定  
const setInitialCalendarTheme = () => {  
  const currentTheme = document.documentElement.getAttribute("saved-theme")  
  if (currentTheme) {  
    changeCalendarTheme({ detail: { theme: currentTheme } } as CustomEventMap["themechange"])  
  }  
}  
  
document.addEventListener("nav", () => { 
  // 初期テーマを設定  
  setInitialCalendarTheme()  
    
  // テーマ変更イベントを監視  
  document.addEventListener("themechange", changeCalendarTheme)  
  window.addCleanup(() => document.removeEventListener("themechange", changeCalendarTheme)) })
return {
  s("today.iso", {
    t(os.date("%Y-%m-%d")),
  }),
  s("tomorrow.iso", {
    t(os.date("%Y-%m-%d",os.time()+24*60*60)),
  })
}

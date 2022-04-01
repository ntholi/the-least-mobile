export const money = (value: number | undefined) => {
  const cur = 'R';
  if (value) {
    return (
      cur +
      parseFloat(String(value))
        .toFixed(2)
        .replace(/\d(?=(\d{3})+\.)/g, '$&,')
    );
  }
  return cur + '0.00';
};

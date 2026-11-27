/// Clamps `val` to the inclusive range `[min, max]`.
///
/// Precondition: `min <= max`.
#[hax_lib::requires(min <= max)]
#[hax_lib::ensures(|result| result >= min && result <= max)]
pub fn clamp_u32(val: u32, min: u32, max: u32) -> u32 {
    if val < min {
        min
    } else if val > max {
        max
    } else {
        val
    }
}

/// Checked addition that saturates at `u32::MAX` instead of overflowing.
#[hax_lib::ensures(|result| result >= a && result >= b)]
pub fn saturating_add_u32(a: u32, b: u32) -> u32 {
    a.saturating_add(b)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_clamp_u32() {
        assert_eq!(clamp_u32(5, 1, 10), 5);
        assert_eq!(clamp_u32(0, 1, 10), 1);
        assert_eq!(clamp_u32(42, 1, 10), 10);
    }

    #[test]
    fn test_saturating_add_u32() {
        assert_eq!(saturating_add_u32(2, 3), 5);
        assert_eq!(saturating_add_u32(u32::MAX, 10), u32::MAX);
    }
}

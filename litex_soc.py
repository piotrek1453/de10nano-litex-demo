#!/usr/bin/env python3
from litex_boards.platforms.terasic_de10nano import Platform
from litex_boards.targets.terasic_de10nano import BaseSoC as LiteXBaseSoC
from litex.soc.integration.builder import Builder
from litex.soc.integration.soc import SoCRegion
from litex.build.parser import LiteXArgumentParser


class BaseSoC(LiteXBaseSoC):
    def __init__(self, extra_ip: bool, **kwargs):
        super().__init__(**kwargs)
        if extra_ip:
            # example additional ip: new memory region
            self.bus.add_region(
                "my_rom", SoCRegion(origin=0x50000000, size=0x1000, mode="rwx")
            )


def main():
    parser = LiteXArgumentParser(
        platform=Platform, description="Custom DE10-Nano SoC"
    )
    # custom parser arguments: example
    parser.add_target_argument(
        "--with-extra-ip", action="store_true", help="Enable extra IP"
    )

    args = parser.parse_args()

    soc = BaseSoC(extra_ip=args.with_extra_ip, **parser.soc_argdict)
    builder = Builder(soc, **parser.builder_argdict)

    if args.build:
        builder.build(**parser.toolchain_argdict)
    if args.load:
        prog = soc.platform.create_programmer()
        prog.load_bitstream(builder.get_bitstream_filename(mode="sram"))


if __name__ == "__main__":
    main()
